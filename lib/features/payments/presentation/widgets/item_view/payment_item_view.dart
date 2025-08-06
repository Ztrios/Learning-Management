import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class PaymentItemView extends StatelessWidget {
  final String invoiceId;
  final String description;
  final String paymentDate;
  final String totalAmount;

  const PaymentItemView({
    super.key,
    required this.invoiceId,
    required this.description,
    required this.paymentDate,
    required this.totalAmount
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingV10,
      child: Row(
        children: [
          gap4,

          Text(
            invoiceId,
            style: AppTextStyles.bodyMedium,
          ),

          gap28,

          Text(
            description,
            style: AppTextStyles.bodyMedium,
          ),

          gap24,

          Text(
            paymentDate,
            style: AppTextStyles.bodyMedium,
          ),

          gap12,

          Text(
            "$totalAmount/-",
            style: AppTextStyles.bodyMedium,
          ),


          Icon(
            Icons.arrow_forward_ios,
            color: AppColors.blueLight,
          )

        ],
      ),
    );
  }
}
