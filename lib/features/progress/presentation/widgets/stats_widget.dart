import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';

class StatsWidget extends StatelessWidget {
  final String svgIcon;
  final String title;
  final String value;

  const StatsWidget({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      spacing: 3.h,
      children: [

        SvgPicture.asset(
            svgIcon
        ),

        Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white60
          ),
        ),
        Text(
          "#$value",
          style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.white
          ),
        )
      ],
    );
  }
}
