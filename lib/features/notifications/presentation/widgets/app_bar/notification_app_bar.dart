import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: paddingH24,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 5,
              offset: Offset(0, -2),
              spreadRadius: 1,
            )
          ]
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: crossCenter,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blueLight.withValues(alpha: 0.1),
              child: IconButton(
                  onPressed: ()=> Navigator.pop(context),
                  icon: Padding(
                    padding: paddingLeft4,
                    child: Icon(
                      Icons.arrow_back_ios, color: AppColors.blueLight,),
                  )
              ),
            ),

            const Spacer(),

            Text(
              "Notifications",
              style: AppTextStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.w900
              ),
            ),

            gap24,

            const Spacer()

          ],
        ),
      ),
    );
  }
}
