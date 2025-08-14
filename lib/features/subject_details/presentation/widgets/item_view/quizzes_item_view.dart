import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';

class QuizzesItemView extends StatelessWidget {
  final double totalMarks;
  final double getMarks;
  final String title;
  final String status;
  final bool isCompleted;

  const QuizzesItemView({
    super.key,
    required this.totalMarks,
    required this.getMarks,
    required this.title,
    required this.status,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            width: 30.w,
            height: 30.w,
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
              SizedBox(
                width: 250.w,
                child: Text(
                  title,
                  style: AppTextStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),

              gap12,

              Row(
                children: [
                  Text("Result: $getMarks/$totalMarks", style: AppTextStyles.bodyMedium),

                  gap36,

                  Text(
                      status,
                      style: AppTextStyles.bodyMedium.copyWith(
                          color: status == "MISSED" ? AppColors.errorRed : null
                      )
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
