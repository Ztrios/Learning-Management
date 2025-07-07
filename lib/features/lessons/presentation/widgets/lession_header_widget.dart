import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';


class HeaderCard extends StatelessWidget {
  final String subject;
  final String subjectIcon;
  final Color shapeColor;
  final Color background;

  const HeaderCard({
    super.key,
    required this.subject,
    required this.subjectIcon,
    required this.shapeColor,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius16,
      child: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 120.h,
            padding: padding16,
            color: background,
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("12/25 Lessons", style: AppTextStyles.caption.copyWith(color: Colors.white)),
                Text("18/30 Assignments", style: AppTextStyles.caption.copyWith(color: Colors.white)),
                Text("12/25 quizzes", style: AppTextStyles.caption.copyWith(color: Colors.white)),
              ],
            ),
          ),
          Positioned(
            top: -60,
            right: -30,
            child: SvgPicture.asset(
              "assets/images/draw_shape.svg",
              colorFilter: ColorFilter.mode(shapeColor, BlendMode.srcIn),
            ),
          ),
          Positioned(
            right: 30,
            top: 30,
            child: SvgPicture.asset(subjectIcon),
          ),
        ],
      ),
    );
  }
}
