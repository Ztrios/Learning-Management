import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/quizzes_item_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/listview/mcq_list_view.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class QuizSubmissionPage extends StatelessWidget {

  static String get path => "/quiz-submit";
  static String get name => "quiz-submit";

  const QuizSubmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              const SecondaryAppBar(
                title: "Lesson 1: Integration",
              ),

              gap12,

              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: paddingH24,
                  child: Column(
                    crossAxisAlignment: crossCenter,
                    children: [

                      QuizzesItemView(
                          title: "Assignment 2: Trigonometry",
                          status: "Remaining: 01:20",
                          isCompleted: true
                      ),

                      gap12,

                      Text(
                        "Questions",
                        style: AppTextStyles.titleLarge.copyWith(
                          color: AppColors.deepOrange
                        ),
                      ),

                      Divider(
                        thickness: 2.w,
                      ),


                      McqListView()


                    ],
                  ),
                ),
              )



            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 1.sw,
        height: 100.h,
        padding: paddingH24,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 20,
                offset: Offset(0, -2),
                spreadRadius: 4,
              )
            ]
        ),
        child: Center(
          child: PrimaryButton(
            onPressed: (){},
            text: "Submit",
            background: AppColors.deepOrange,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
