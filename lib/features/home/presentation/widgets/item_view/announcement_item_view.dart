import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class AnnouncementItemView extends StatelessWidget {
  final String title;
  final String content;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const AnnouncementItemView({
    super.key,
    required this.title,
    required this.content,
    required this.backgroundColor,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding12,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: radius12,
        border: Border.all(color: const Color(0xFFE0E6ED)),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Header Row
          Column(
            crossAxisAlignment: crossStart,
            children: [
              Row(
                crossAxisAlignment: crossCenter,
                children: [
                  Container(
                    width: 26.w,
                    height: 26.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCE7F9),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    alignment: Alignment.center,
                    child: const Text("📢", style: TextStyle(fontSize: 16)),
                  ),

                  gap8,

                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Icon(
                  //   Icons.arrow_forward_ios,
                  //   color: AppColors.blueLight,
                  //   size: 15.sp,
                  // )

                ],
              ),

              gap6,

              /// Message
              Text(
                content,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                    color: Colors.white
                ),
              ),
            ],
          ),

          /// Footer
          Row(
            mainAxisAlignment: mainSpaceBetween,
            children: [

              Container(
                padding: padding6,
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: radius6,
                ),
                child: Text(
                  "View More",
                  style: AppTextStyles.bodyMedium.copyWith(
                      color: Colors.white
                  ),
                ),
              ),

              const Spacer(),

              Text(
                "— Academic Office",
                style: AppTextStyles.caption.copyWith(
                    color: Colors.white
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
