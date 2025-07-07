import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/presentation/widgets/progress_indicator_circle.dart';

class StatsProgressCard extends StatelessWidget {
  const StatsProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      decoration: BoxDecoration(
        borderRadius: radius16,
        color: const Color(0xFFE7E5FA),
      ),
      child: Column(
        crossAxisAlignment: crossCenter,
        mainAxisAlignment: mainCenter,
        children: [
          _LanguageDropdown(),
          gap12,
          _ProgressText(),
          gap24,
          ProgressIndicatorCircle(
            percantage: 60,
            message: "Completed!",
            progressColor: AppColors.deepPurpleAccent,
            isForExam: false,
          ),
          gap24,
          _StatsCards(),
        ],
      ),
    );
  }
}

class _LanguageDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainEnd,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.deepBlue, size: 25.sp),
          label: Text(
            "English",
            style: AppTextStyles.titleSmall.copyWith(fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _ProgressText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "You have Completed ",
          style: AppTextStyles.titleLarge.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "37% of your full course!",
          style: AppTextStyles.titleLarge.copyWith(
            fontWeight: FontWeight.w900,
            color: AppColors.deepPurpleAccent,
          ),
        ),
      ],
    );
  }
}


class _StatsCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.w,
      children: [
        _StatCard(
          value: "32",
          label: "Quiz Attended",
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        _StatCard(
          value: "21",
          label: "Assignment Done",
          backgroundColor: AppColors.deepPurpleAccent,
          textColor: Colors.white,
          iconPath: "assets/icons/score_icon.svg",
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final String? iconPath;

  const _StatCard({
    required this.value,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130.h,
        padding: padding12,
        decoration: BoxDecoration(
          borderRadius: radius16,
          color: backgroundColor,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainCenter,
              children: [
                Text(
                  value,
                  style: AppTextStyles.displaySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  label,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w900,
                    color: textColor,
                  ),
                ),
              ],
            ),
            if (iconPath != null)
              Positioned(
                right: 10,
                child: SvgPicture.asset(
                  iconPath!,
                  width: 35.w,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
