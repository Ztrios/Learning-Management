import 'package:defer_pointer/defer_pointer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/assignments_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/submission_types_selection.dart';
import 'package:learning_management/features/lessons/presentation/widgets/files_upload_widget.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class ExamsSubmissionPage extends StatelessWidget {

  static String get path => "/exam-submission";
  static String get name => "exam-submission";

  const ExamsSubmissionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              const SecondaryAppBar(
                title: "Lesson 1: ",
              ),

              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 1.sh,
                  padding: paddingH24,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [

                        AssignmentItemView(
                            title: "Assignment 1: Trigonometry",
                            status: "Remaining: 12.30",
                            isCompleted: true
                        ),

                        gap24,

                        Text(
                          "In Mathematics",
                          style: AppTextStyles.titleSmall,
                        ),

                        Text(
                          "Integration is a fundamental concept in calculus, specifically integral calculus. It is the inverse operation of differentiation and is used to find the area under a curve, among other applications. For example, in physics, integration can be used to calculate the total distance traveled by an object given its velocity function. ",
                          style: AppTextStyles.caption,
                        ),

                        gap24,

                        SizedBox(
                          width: 1.sw,
                          child: Column(
                            children: [

                              gap6,

                              Row(
                                children: [

                                  NetworkImageWidget(
                                    "https://i.ytimg.com/vi/NcoRlvM1dmg/sddefault.jpg",
                                    width: 130.w,
                                    height: 80.h,
                                    showPlayButton: true,
                                  ),

                                  gap12,

                                  Column(
                                    crossAxisAlignment: crossStart,
                                    children: [
                                      Text(
                                        "Integration Formula",
                                        style: AppTextStyles.titleSmall.copyWith(
                                            fontWeight: FontWeight.w900,
                                            color: AppColors.textPrimary
                                        ),
                                      ),

                                      Text(
                                        "Lecture by Susant Kumar",
                                        style: AppTextStyles.bodySmall.copyWith(
                                            color: AppColors.textSecondary
                                        ),
                                      ),

                                      Text(
                                        "2:34",
                                        style: AppTextStyles.caption,
                                      )

                                    ],
                                  )

                                ],
                              ),

                              gap6
                            ],
                          ),
                        ),

                        Divider(thickness: 2),

                        gap12,

                        FilesUploadWidget()

                      ],
                    ),
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
