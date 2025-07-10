import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/home/presentation/pages/task_list_page.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/task_item_view.dart';

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
              onPressed: ()=> context.push(HomePage.path + TaskListPage.path),
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


        TaskItemView(
            quantity: 12,
            type: "Quizzes",
            title: "English Quiz",
            subject: "English",
            svgAsset: "assets/images/english_quiz.svg"
        ),

        gap20,

        TaskItemView(
            quantity: 6,
            type: "Question",
            title: "Math Assignment",
            subject: "Math",
            svgAsset: "assets/images/math_assignment.svg"
        ),

      ],
    );
  }
}
