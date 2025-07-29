import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';

class OnboardingActionButtons extends StatelessWidget {
  final int currentIndex;
  final int lastIndex;
  final VoidCallback onSkip;
  final VoidCallback onNextOrDone;

  const OnboardingActionButtons({
    super.key,
    required this.currentIndex,
    required this.lastIndex,
    required this.onSkip,
    required this.onNextOrDone,
  });

  @override
  Widget build(BuildContext context) {
    final isLast = currentIndex == lastIndex;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(
            "Skip",
            style: TextStyle(
              color: AppColors.deepPurpleAccent,
              fontWeight: FontWeight.w900
            ),
          ),
        ),

        PrimaryButton(
          onPressed: onNextOrDone,
          width: 80.w,
          height: 40.h,
          text: isLast ? "Done" : "Next",
          background: AppColors.deepBlue,
        )
      ],
    );
  }
}
