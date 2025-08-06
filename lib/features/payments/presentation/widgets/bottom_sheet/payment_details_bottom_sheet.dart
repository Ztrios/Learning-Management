import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:learning_management/features/payments/data/models/payment_history_model.dart';
import 'package:learning_management/features/payments/presentation/widgets/bottom_sheet_title.dart';
import 'package:learning_management/features/payments/presentation/widgets/column_text_widget.dart';
import 'package:learning_management/features/payments/presentation/widgets/payment_row_widget.dart';


void showPaymentDetailsBottomSheet({required BuildContext context, required Content content}){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context){
        return PaymentDetailsBottomSheet(
          content: content,
        );
      }
  );
}

class PaymentDetailsBottomSheet extends StatelessWidget {
  final Content content;
  const PaymentDetailsBottomSheet({
    super.key,
    required this.content
  });

  @override
  Widget build(BuildContext context) {



    return Container(
      width: 1.sw,
      height: 600.h,
      padding: padding24,
      decoration: BoxDecoration(borderRadius: radius16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header Row
          BottomSheetTitle(),

          gap12,

          Text(
            "Summery",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.blueLight
            ),
          ),

          gap12,

          Text(
            "Payment for Month:",
            style: AppTextStyles.titleMedium.copyWith(
                fontWeight: FontWeight.w900,
            ),
          ),

          Text(
            "September 2025 - November 2025",
            style: AppTextStyles.bodyMedium,
          ),


          gap12,

          Row(
            spacing: 70.w,
            children: [
              LabelValueColumn(
                  label: "Payment Type:",
                  value: "Monthly Fee"
              ),

              LabelValueColumn(
                  label: "Payment For:",
                  value: "3 Months"
              ),
            ],
          ),

          gap12,

          const Divider(),

          gap12,

          Row(
            spacing: 45.w,
            children: [
              LabelValueColumn(
                  label: "Payment Method:",
                  value: "Bkash"
              ),

              LabelValueColumn(
                  label: "Payment Date:",
                  value: "02/07/2025"
              ),
            ],
          ),


          gap12,

          const Divider(),

          gap12,

          Row(
            spacing: 120.w,
            children: [
              LabelValueColumn(
                  label: "Coupon:",
                  value: "DIS20"
              ),

              LabelValueColumn(
                  label: "Discount:",
                  value: "20%"
              ),
            ],
          ),


          gap12,
          const Divider(),
          gap12,

          /// Payment Summary
          PaymentRowWidget(label: "Payment Amount",value:  "6000/-"),
          PaymentRowWidget(label: "Discount", value:  "400/-"),
          PaymentRowWidget(label: "Total", value: "5600/-", highlight: true),


          gap12,
        ],
      ),
    );
  }


}
