import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String message;
  final Color? textColor;
  const EmptyWidget({
    super.key,
    required this.title,
    required this.message,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossCenter,
      mainAxisAlignment: mainCenter,
      children: [

        Image.asset(
          "assets/images/empty_data.png",
        ),

        gap4,

        Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: textColor
          ),
        ),

        Text(
          message,
          style: AppTextStyles.caption.copyWith(
            color: textColor
          ),
        )

      ],
    );
  }
}
