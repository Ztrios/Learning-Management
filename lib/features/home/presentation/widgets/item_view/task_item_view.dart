import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class TaskItemView extends StatelessWidget {
  final int quantity;
  final String type;
  final String title;
  final String subject;
  final String svgAsset;
  final VoidCallback onTap;

  const TaskItemView({
    super.key,
    required this.quantity,
    required this.type,
    required this.title,
    required this.subject,
    required this.svgAsset,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5.w,
            color: AppColors.grey,
          ),
          borderRadius: radius20,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.randomColors(),
          borderRadius: radius16,
          splashFactory: InkRipple.splashFactory,
          child: Container(
            width: 1.sw,
            height: 80.h,
            padding: padding10,
            child: Row(
              children: [
                SvgPicture.asset(
                  svgAsset,
                  width: 65.w,
                  height: 65.w,
                ),

                gap12,

                Column(
                  crossAxisAlignment: crossStart,
                  mainAxisAlignment: mainCenter,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$subject • $quantity $type",
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.deepPurpleAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
