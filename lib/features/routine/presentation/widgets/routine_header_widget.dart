import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';


class ClassRoutineHeader extends StatelessWidget {
  const ClassRoutineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Time",
          style: AppTextStyles.titleSmall.copyWith(
            color: AppColors.textGreyLight,
            fontWeight: FontWeight.w900,
          ),
        ),

        gap24,

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Courses",
                style: AppTextStyles.titleSmall.copyWith(
                  color: AppColors.textGreyLight,
                  fontWeight: FontWeight.w900,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/filter_icon.svg",
                  width: 30.w,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
