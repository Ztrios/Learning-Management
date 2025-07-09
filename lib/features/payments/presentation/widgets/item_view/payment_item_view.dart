import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class PaymentItemView extends StatelessWidget {
  const PaymentItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingV10,
      child: Row(
        children: [
          gap4,

          Text(
            "2343456",
            style: AppTextStyles.bodyMedium,
          ),

          gap28,

          Text(
            "Monthly",
            style: AppTextStyles.bodyMedium,
          ),

          gap24,

          Text(
            "06.12.2025",
            style: AppTextStyles.bodyMedium,
          ),

          gap12,

          Text(
            "1200/-",
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
