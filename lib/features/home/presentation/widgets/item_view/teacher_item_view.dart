import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class TeacherItemView extends StatelessWidget {
  final String teacherName;
  final Color textColor;
  const TeacherItemView({
    super.key,
    required this.teacherName,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        CircleAvatar(
          radius: 12.r,
          child: Text(
            teacherName[0],
            style: AppTextStyles.titleMedium.copyWith(
              color: textColor
            ),
          ),
        ),

        gap10,

        Text(
          teacherName,
          style: AppTextStyles.caption.copyWith(
              color: Colors.white
          ),
        )

      ],
    );
  }
}
