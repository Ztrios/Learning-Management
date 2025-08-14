import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),

        if(onPressed != null)
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText ?? "See All",
            style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.deepPurpleAccent,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
