import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
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
          BottomSheetTitle(
            title: "Invoice ID: ${(content.invoiceId ?? 0).toString().substring(4)}",
          ),

          gap12,

          Text(
            "Summery",
            style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w900,
              color: AppColors.blueLight
            ),
          ),

          gap12,

          if(content.paymentMonth.isNotNullAndNotEmpty)
          Column(
            crossAxisAlignment: crossStart,
            children: [
              Text(
                "Payment for Month:",
                style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w900,
                ),
              ),

              Text(
                "${DateTimeFormatters.formatMonthYear(content.paymentMonth!.first)} - "
                    "${DateTimeFormatters.formatMonthYear(content.paymentMonth!.last)}",
                style: AppTextStyles.bodyMedium,
              ),
            ],
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
                  value: "${content.noOfMonth} Months"
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
                  value: content.paymentMethod ?? "Unknown"
              ),

              LabelValueColumn(
                  label: "Payment Date:",
                  value: DateTimeFormatters.formatDate(dateTime: content.paymentDate)
              ),
            ],
          ),


          gap12,

          // const Divider(),
          //
          // gap12,
          //
          // Row(
          //   spacing: 120.w,
          //   children: [
          //     LabelValueColumn(
          //         label: "Coupon:",
          //         value: "DIS20"
          //     ),
          //
          //     LabelValueColumn(
          //         label: "Discount:",
          //         value: "20%"
          //     ),
          //   ],
          // ),


          gap12,
          const Divider(),
          gap12,

          /// Payment Summary
          PaymentRowWidget(
              label: "Payment Amount",
              value:  "${content.paidAmount}/-"
          ),
          PaymentRowWidget(
              label: "Discount",
              value:  "${content.totalDiscount}/-"
          ),
          PaymentRowWidget(
              label: "Total",
              value: "${content.totalAmount}/-",
              highlight: true
          ),


          gap12,
        ],
      ),
    );
  }


}
