import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class ExamsProgressCard extends StatelessWidget {
  const ExamsProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      decoration: BoxDecoration(
        borderRadius: radius16,
        color: AppColors.blueLight,
      ),
      child: Column(
        crossAxisAlignment: crossCenter,
        mainAxisAlignment: mainCenter,
        children: [
          _LanguageDropdown(),
          gap12,
          Text(
            "Your result ",
            style: AppTextStyles.titleLarge.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          ),
          gap24,
          _ProgressIndicatorCircle(),
          gap48,
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


class _ProgressIndicatorCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 150.w,
          height: 150.w,
          child: CircularProgressIndicator(
            value: 0.7,
            strokeWidth: 12.w,
            color: AppColors.deepOrange,
            backgroundColor: Colors.white,
            strokeCap: StrokeCap.round,
          ),
        ),
        Column(
          children: [
            RichText(
              text: TextSpan(
                text: "37",
                style: AppTextStyles.displaySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                children: [
                  TextSpan(
                    text: "/100",
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Completed!",
              style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.greyLight
              ),
            ),
          ],
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
          backgroundColor: AppColors.deepOrange,
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
