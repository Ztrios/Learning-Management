import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';

class PaymentRowWidget extends StatelessWidget {
  final bool highlight;
  final String label;
  final String value;
  const PaymentRowWidget({
    super.key,
    this.highlight = false,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.titleMedium.copyWith(
            color: highlight ? AppColors.blueLight : null,
          ),
        ),
        Text(value, style: AppTextStyles.titleMedium),
      ],
    );
  }
}
