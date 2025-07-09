import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';

class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Invoice ID: 478593",
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.blueLight,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.clear, size: 30.sp, color: AppColors.blueLight),
        ),
      ],
    );
  }
}
