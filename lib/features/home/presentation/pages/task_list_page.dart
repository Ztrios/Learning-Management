import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/task_item_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';

class TaskListPage extends StatelessWidget {
  static String get path => "/tasks";
  static String get name => "/tasks";

  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        color: AppColors.background,
        child: Column(
          children: [

            gap12,

            SecondaryAppBar(
              title: "Your Tasks"
            ),

            gap6,

            Expanded(
              child: Container(
                width: 1.sw,
                height: 1.sh,
                padding: paddingH24,
                child: ListView.builder(
                  itemCount: 7,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      return Padding(
                        padding: paddingV8,
                        child: TaskItemView(
                            quantity: index.isEven ? 12 : 6,
                            type: index.isEven ? "Quizzes" : "Question",
                            title: index.isEven ? "English Quiz" : "Math Assignment",
                            subject: index.isEven ? "English" : "Math",
                            svgAsset: index.isEven ? "assets/images/english_quiz.svg" : "assets/images/math_assignment.svg"
                        ),
                      );
                    }
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
