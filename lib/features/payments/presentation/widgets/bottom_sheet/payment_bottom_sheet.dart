import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/payments/data/models/invoice_model.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_bloc.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_event.dart';
import 'package:learning_management/features/payments/presentation/pages/bkash_payment_page.dart';
import 'package:learning_management/features/payments/presentation/widgets/bottom_sheet_title.dart';
import 'package:learning_management/features/payments/presentation/widgets/fee_type_selection.dart';
import 'package:learning_management/features/payments/presentation/widgets/month_selection_dropdown.dart';
import 'package:learning_management/features/payments/presentation/widgets/payment_row_widget.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';


void showPaymentBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return PaymentBottomSheet();
      }
  );
}

class PaymentBottomSheet extends HookWidget {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentDuration = useState<int>(1);
    final monthlyFee = useState<double>(0);
    final paymentAmount = useState<double>(0);
    final totalDiscount = useState<double>(0);
    final totalAmount = useState<double>(0);


    void paymentCalculation({required Invoice? invoice, required int paymentDuration}){
      monthlyFee.value = (invoice?.monthlyFee ?? 0) * paymentDuration;
      paymentAmount.value = (invoice?.monthlyFee ?? 0) * paymentDuration + (invoice?.registrationFee ?? 0);
      totalDiscount.value = (invoice?.monthlyDiscount ?? 0) * paymentDuration + (invoice?.regDiscount ?? 0);
      totalAmount.value = (invoice?.monthlyAmountExcludeDiscount ?? 0) * paymentDuration + (invoice?.registrationAmountExcludeDiscount ?? 0);
    }


    void createPayment(){
      print("Hello");
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        Map<String,dynamic> body = {
          "studentId": studentId,
          "noOfMonth": paymentDuration.value,
          //"registrationFee": 0,
          //"monthlyFee": 2000,
          //"totalAmount": 2000,
          "paymentMethod": "BKASH",
          "paidAmount": totalAmount.value,
        };
        context.read<PaymentBloc>().add(CreatePayment(body: body));
      }
    }


    return Container(
      width: 1.sw,
      height: 600.h,
      padding: padding24,
      decoration: BoxDecoration(borderRadius: radius16),
      child: BlocConsumer<PaymentBloc, PaymentState>(
        listenWhen: (previous, current){
          return previous.createPaymentStatus.isLoading && current.createPaymentStatus.isSuccess;
        },
        listener: (context, state){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => BkashPaymentPage(
                  bkashUrl: state.paymentEntity?.paymentUrl ?? ""
              )
          ));
        },
        builder: (context, state) {

          Invoice? invoice = state.invoiceEntity?.invoice;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Header Row
              BottomSheetTitle(
                title: "Payment",
              ),

              gap12,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment for month",
                    style: AppTextStyles.titleMedium,
                  ),

                  MonthSelectionDropdown(
                    months: [1,2,3,6,12],
                    onMonthSelected: (selectedMonth) {
                      paymentDuration.value = selectedMonth;
                      paymentCalculation(invoice: invoice, paymentDuration: selectedMonth);
                    },
                  ),
                ],
              ),

              gap12,
              const Divider(),
              gap12,

              /// Fee Selection Widget
              FeeTypeSelection(
                isRegistrationDone: invoice?.isRegistrationDone ?? false,
                selectedFeeType: (value) {

                },
              ),

              gap12,
              const Divider(),
              gap12,


              /// Coupon Input
              titleText("Apply Coupon"),
              gap6,
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40.h,
                      child: TextField(
                        decoration: InputDecoration(
                          border: outlineBorder,
                          enabledBorder: outlineBorder,
                          focusedBorder: outlineBorder,
                          errorBorder: outlineBorder,
                        ),
                      ),
                    ),
                  ),
                  gap12,
                  SizedBox(
                    width: 100.w,
                    height: 40.h,
                    child: PrimaryButton(
                      onPressed: (){},
                      text: "Apply",
                    ),
                  ),
                ],
              ),

              gap12,

              /// Payment Summary

              if(invoice?.isRegistrationDone == false)
                PaymentRowWidget(
                    label: "Registration Fee",
                    value: "${invoice?.registrationFee ?? 0}/-"
                ),

              PaymentRowWidget(
                  label: "Monthly Fee",
                  value: "${monthlyFee.value}/-"
              ),

              PaymentRowWidget(
                  label: "Payment Amount",
                  value: "${paymentAmount.value}/-"
              ),

              PaymentRowWidget(
                  label: "Total Discount",
                  value: "${totalDiscount.value}/-"
              ),

              PaymentRowWidget(
                  label: "Total",
                  value: "${totalAmount.value}/-",
                  highlight: true
              ),

              const Spacer(),

              /// Final Button
              PrimaryButton(
                onPressed: createPayment,
                isLoading: state.createPaymentStatus.isLoading,
                text: "Pay ${totalAmount.value} Tk",
              ),

              gap12,
            ],
          );
        },
      ),
    );
  }


}


final outlineBorder = OutlineInputBorder(
  borderRadius: radius12,
  borderSide: BorderSide(width: 1.5.w, color: AppColors.blueLight),
);

Widget titleText(String text, {Color? color}) =>
    Text(
      text,
      style: AppTextStyles.titleMedium.copyWith(color: color),
    );
