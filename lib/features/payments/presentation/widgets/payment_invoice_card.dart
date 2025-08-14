import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/payments/data/models/invoice_model.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_bloc.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_bloc.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_event.dart';
import 'package:learning_management/features/payments/presentation/widgets/bottom_sheet/payment_bottom_sheet.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PaymentInvoiceCard extends HookWidget {
  final bool isRedNotice;
  const PaymentInvoiceCard({
    super.key,
    required this.isRedNotice
  });

  @override
  Widget build(BuildContext context) {

    void getPayment(){
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<PaymentBloc>().add(GetInvoice(studentId: studentId.toString()));
      }
    }

    useEffect((){
      Future.microtask(()=> getPayment());
      return null;
    },[]);


    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {

        Invoice? invoice = state.invoiceEntity?.invoice;

        return Skeletonizer(
          enabled: state.status.isLoading,
          child: Container(
            width: 1.sw,
            padding: padding16,
            decoration: BoxDecoration(
                color: (isRedNotice ? AppColors.errorRed : AppColors.blueLight)
                    .withValues(alpha: 0.1),
                borderRadius: radius16,
                border: Border.all(
                    width: 1.w,
                    color: (isRedNotice ? AppColors.errorRed : AppColors
                        .blueLight)
                )
            ),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  "Monthly Payment of ${DateTimeFormatters.formatMonthYear(invoice?.toPayableMonth ?? "2025-08")} Invoice.",
                  style: AppTextStyles.caption.copyWith(
                      color: isRedNotice ? AppColors.errorRed : AppColors
                          .textPrimary
                  ),
                ),

                gap6,

                Row(
                  mainAxisAlignment: mainSpaceBetween,
                  children: [

                    if(isRedNotice == false)
                      Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          Text(
                            "Amount: ${invoice?.totalAmount ?? 0}/-",
                            style: AppTextStyles.titleMedium,
                          ),

                          if(invoice?.isRegistrationDone == false)
                            Text(
                              "(Registration fee included)",
                              style: AppTextStyles.caption,
                            )
                        ],
                      ),

                    const Spacer(),

                    SizedBox(
                      width: 100.w,
                      height: 35.h,
                      child: PrimaryButton(
                        onPressed: ()=> showPaymentBottomSheet(context),
                        text: "Pay Now",
                        background: (isRedNotice ? AppColors.errorRed : AppColors
                            .blueLight),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
