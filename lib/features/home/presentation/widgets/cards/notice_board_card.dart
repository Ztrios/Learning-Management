import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class NoticeBoardCard extends StatelessWidget {
  final String title;
  final String message;
  final String issuedBy;
  final DateTime issuedDate;

  const NoticeBoardCard({
    super.key,
    required this.title,
    required this.message,
    required this.issuedBy,
    required this.issuedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding12,
      decoration: BoxDecoration(
        color: AppColors.deepPurpleAccent,
        borderRadius: radius12,
        border: Border.all(color: const Color(0xFFE0E6ED)),
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          /// Header Row
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
            message,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption.copyWith(
              color: Colors.white
            ),
          ),

          SizedBox(height: 8.h),

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

              Text(
                "$issuedBy • 12 Dec 2025",
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
