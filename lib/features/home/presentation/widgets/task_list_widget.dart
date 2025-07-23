import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_event.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/home/presentation/pages/task_list_page.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/task_item_view.dart';
import 'package:learning_management/features/home/presentation/widgets/section_header.dart';
import 'package:learning_management/features/lessons/presentation/pages/assignment_submission_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/quiz_submission_page.dart';
import 'package:learning_management/widgets/error_widget/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TaskListWidget extends HookWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    void getTasks(){
      int? sectionId = context.read<AuthBloc>().state.signInEntity?.signInData?.sectionId;
      if(sectionId != null){
        context.read<HomeBloc>().add(GetStudentTasks(sectionId: sectionId.toString()));
      }
    }
    
    useEffect((){
      Future.microtask(()=> getTasks());
      return null;
    },[]);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if((state.tasksEntity?.taskData).isNotNullAndNotEmpty){
          return Column(
            children: [

              Skeletonizer(
                enabled: state.status.isLoading,
                child: Column(
                  children: [

                    SectionHeader(
                      title: "Your Tasks",
                      onPressed: () =>
                          context.push(HomePage.path + TaskListPage.path),
                    ),

                    Column(
                      children: List.generate(state.tasksEntity!.taskData!.length > 2 ? 2 : state.tasksEntity!.taskData!.length, (index){
                        return Padding(
                          padding: paddingBottom16,
                          child: TaskItemView(
                            quantity: (state.tasksEntity!.taskData![index].totalMarks ?? 10.0).floor(),
                            type: state.tasksEntity!.taskData![index].type ?? "Quiz",
                            title: state.tasksEntity!.taskData![index].title ?? "English Quiz",
                            subject: state.tasksEntity!.taskData![index].subjectName ?? "English",
                            svgAsset: state.tasksEntity!.taskData![index].type == "QUIZ" ?
                            "assets/images/english_quiz.svg" : "assets/images/math_assignment.svg",
                            onTap: () {
                              if(state.tasksEntity!.taskData![index].type == "QUIZ"){
                                context.push(LessionsPage.path + LessionDetailsPage.path +
                                    QuizSubmissionPage.path);
                              }else{
                                context.push(LessionsPage.path + LessionDetailsPage.path +
                                    AssignmentSubmissionPage.path);
                              }
                            },
                          ),
                        );
                      })
                    ),
                  ],
                ),
              ),

            ],
          );
        }else if(state.status.isError){
          return ErrorViewWidget(
              message: state.message ?? "Not Found!"
          );
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}
