import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class ExamItemView extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final bool showStar;
  final double totalMarks;
  final double getMarks;
  final String examDate;
  final String startTime;

  final String endTime;

  const ExamItemView({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.showStar,
    required this.totalMarks,
    required this.getMarks,
    required this.examDate,
    required this.startTime,
    required this.endTime
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: paddingV6,
          padding: padding16,
          decoration: BoxDecoration(
            color: (isCompleted ? AppColors.deepOrange : Color(0xFFDADADA))
                .withValues(alpha: 0.2),
            borderRadius: radius20,
            border: isCompleted
                ? Border.all(width: 1.w, color: Colors.deepOrange)
                : null,
          ),
          child: Row(
            children: [

              Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  color: isCompleted ? AppColors.deepGreen : Color(0xFFDADADA),
                  borderRadius: radius6,
                ),
                child: Icon(
                  isCompleted ? Icons.check : Icons.lock,
                  color: isCompleted ? Colors.white : Colors.black,
                ),
              ),


              gap12,

              Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text("Date: $examDate", style: AppTextStyles.bodyMedium),

                  Text(
                    title,
                    style: AppTextStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  gap4,

                  Text("Time: $startTime - $endTime", style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary
                  )),
                  Text("Total Marks: $totalMarks", style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
        ),

        if(showStar)
        Positioned(
          top: 20,
          right: 20,
          child: Container(
            width: 25.w,
            height: 25.w,
            decoration: BoxDecoration(
                borderRadius: radius6,
                color: AppColors.blueLight
            ),
            child: Icon(Icons.star,color: Colors.yellow),
          ),
        )

      ],
    );
  }
}
