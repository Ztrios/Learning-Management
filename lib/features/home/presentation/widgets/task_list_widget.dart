import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your Tasks",
              style: AppTextStyles.titleLarge.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),

            TextButton(
              onPressed: (){},
              child: Text(
                "See All",
                style: AppTextStyles.titleSmall.copyWith(
                    color: AppColors.deepPurpleAccent,
                    fontWeight: FontWeight.bold
                ),
              ),
            )

          ],
        ),

        Container(
          width: 1.sw,
          height: 80.h,
          padding: padding10,
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
          child: Row(
            children: [

              SvgPicture.asset(
                "assets/images/english_quiz.svg",
                width: 65.w,
                height: 65.w,
              ),

              gap12,

              Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    "English Quiz",
                    style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    "English • 12 Quizzes",
                    style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.textGrey
                    ),
                  )

                ],
              ),

              const Spacer(),

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.deepPurpleAccent,
              )



            ],
          ),
        ),


        gap20,

        Container(
          width: 1.sw,
          height: 80.h,
          padding: padding10,
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
          child: Row(
            children: [

              SvgPicture.asset(
                "assets/images/math_assignment.svg",
                width: 65.w,
                height: 65.w,
              ),

              gap12,

              Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    "Math Assignment",
                    style: AppTextStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    "Math • 6 Questions",
                    style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.textGrey
                    ),
                  )

                ],
              ),

              const Spacer(),

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.deepPurpleAccent,
              )



            ],
          ),
        )

      ],
    );
  }
}
