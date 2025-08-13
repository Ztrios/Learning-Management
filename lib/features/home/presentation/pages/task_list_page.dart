import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/task_item_view.dart';
import 'package:learning_management/features/home/presentation/widgets/loading_widgets/tasks_loading_widget.dart';
import 'package:learning_management/features/subject_details/presentation/pages/assignment_submission_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/subject_details_page.dart';
import 'package:learning_management/features/subject_details/presentation/pages/quiz_submission_page.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/empty_widget.dart';

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
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if(state.status.isLoading){
                      return TasksLoadingWidget();
                    }else if (state.status.isSuccess){
                      if((state.tasksEntity?.taskData).isNotNullAndNotEmpty){
                        return ListView.builder(
                            itemCount: state.tasksEntity?.taskData?.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: paddingV8,
                                child: TaskItemView(
                                  quantity: (state.tasksEntity!.taskData![index].totalMarks ?? 10.0).floor(),
                                  type: state.tasksEntity!.taskData![index].type ?? "Quiz",
                                  title: state.tasksEntity!.taskData![index].title ?? "English Quiz",
                                  subject: state.tasksEntity!.taskData![index].subjectName ?? "English",
                                  svgAsset: state.tasksEntity!.taskData![index].type == "QUIZ" ?
                                  "assets/images/english_quiz.svg" : "assets/images/math_assignment.svg",
                                  onTap: () {
                                    if(state.tasksEntity!.taskData![index].type == "QUIZ"){
                                      context.push("${SubjectDetailsPage.path}${LessionDetailsPage.path}/0${QuizSubmissionPage.path}/${state.tasksEntity!.taskData![index].id}");
                                    }else{
                                      context.push("${SubjectDetailsPage.path}${LessionDetailsPage.path}/0${AssignmentSubmissionPage.path}/${state.tasksEntity!.taskData![index].id}");
                                    }
                                  },
                                ),
                              );
                            }
                        );
                      }else{
                        return EmptyWidget(
                          title: "No Tasks Found!",
                          message: "Tasks are not found at this moment!",
                        );
                      }
                    }else{
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
