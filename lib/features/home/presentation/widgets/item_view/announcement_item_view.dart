import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class AnnouncementItemView extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final String content;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const AnnouncementItemView({
    super.key,
    required this.isExpanded,
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
        crossAxisAlignment: crossEnd,
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
                maxLines: !isExpanded ? 3 : null,
                overflow: !isExpanded ? TextOverflow.ellipsis : null,
                style: AppTextStyles.caption.copyWith(
                    color: Colors.white
                ),
              ),
            ],
          ),



          //gap8,
          // Wrap(
          //   spacing: 8.w,
          //   runSpacing: 8.h,
          //   children: (attachedFiles ?? ["Hello", "Hello"]).map((file) {
          //     return GestureDetector(
          //       onTap: (){},
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          //         decoration: BoxDecoration(
          //           color: AppColors.blueLight,
          //           borderRadius: radius6,
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Icon(Icons.download, size: 16.sp, color: Colors.white),
          //             gap4,
          //             Text(
          //               "exam-routine.pdf",
          //               style: AppTextStyles.caption.copyWith(color: Colors.white),
          //             ),
          //           ],
          //         ),
          //       ),
          //     );
          //   }).toList(),
          // ),


          gap12,

          Column(
            crossAxisAlignment: crossEnd,
            children: [
              // Text(
              //   "📎 Attached Files:",
              //   style: AppTextStyles.caption.copyWith(color: Colors.white),
              // ),
              // gap6,
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: radius6,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(Icons.download, size: 16.sp, color: Colors.white),
                      // gap4,
                      Text(
                        "📎 Attached Files",
                        style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )




        ],
      ),
    );
  }
}
