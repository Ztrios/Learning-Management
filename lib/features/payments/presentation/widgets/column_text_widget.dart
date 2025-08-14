import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';

class LabelValueColumn extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final CrossAxisAlignment crossAxisAlignment;

  const LabelValueColumn({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          style: labelStyle ??
              AppTextStyles.titleMedium.copyWith(fontWeight: FontWeight.w900),
        ),
        Text(
          value,
          style: valueStyle ?? AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}
