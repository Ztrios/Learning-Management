import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/payments/data/models/invoice_model.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_bloc.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_event.dart';
import 'package:learning_management/features/payments/presentation/widgets/bottom_sheet/payment_bottom_sheet.dart';
import 'package:learning_management/features/payments/presentation/widgets/list_view/payment_list.dart';
import 'package:learning_management/features/payments/presentation/widgets/payment_invoice_card.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentPage extends HookWidget {
  static String get path => "/payment";
  static String get name => "payment";

  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    void getPayment(){
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<PaymentBloc>().add(GetInvoice(studentId: studentId.toString()));
      }
    }

    useEffect((){
      Future.microtask((){
        getPayment();
      });
      // if(true){
      //   Future.microtask(()=> showPaymentBottomSheet(context));
      // }
      return null;
    },[]);

    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              SecondaryAppBar(
                  title: "Payment",
              ),


              gap12,
              
              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: paddingH24,
                  child: Column(
                    children: [

                      BlocBuilder<PaymentBloc, PaymentState>(
                        builder: (context, state) {

                          Invoice? invoice = state.invoiceEntity?.invoice;

                          return Skeletonizer(
                            enabled: state.status.isLoading,
                            child: PaymentInvoiceCard(
                              isRedNotice: false,
                              registrationFeeInclude: invoice?.isRegistrationDone == false,
                              totalAmount: (invoice?.totalAmount ?? 0).toString(),
                              message: "Monthly Payment of ${DateTimeFormatters.formatMonthYear(invoice?.toPayableMonth ?? "2025-08")} Invoice.",
                              onPressed: () => showPaymentBottomSheet(context),
                            ),
                          );
                        },
                      ),

                      gap48,

                      PaymentList()


                    ],
                  ),
                ),
              )
              

            ],
          ),
        ),
      ),
    );
  }
}
