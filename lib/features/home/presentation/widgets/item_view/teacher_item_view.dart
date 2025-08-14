import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class TeacherItemView extends StatelessWidget {
  final String teacherName;
  final Color iconTextColor;
  final Color? nameTextColor;
  
  const TeacherItemView({
    super.key,
    this.nameTextColor,
    required this.teacherName,
    required this.iconTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        CircleAvatar(
          radius: 12.r,
          child: Text(
            teacherName.substring(0,2),
            style: AppTextStyles.bodyMedium.copyWith(
              color: iconTextColor
            ),
          ),
        ),

        gap10,

        Text(
          teacherName,
          style: AppTextStyles.caption.copyWith(
              color: nameTextColor ?? Colors.white
          ),
        )

      ],
    );
  }
}
