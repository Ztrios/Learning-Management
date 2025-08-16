import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/subject_details/data/models/questions_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/quizzes_item_view.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/listview/mcq_list_view.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/submission_header.dart';
import 'package:learning_management/widgets/app_bars/secondary_app_bar.dart';
import 'package:learning_management/widgets/buttons/primary_button.dart';
import 'package:learning_management/widgets/drawer/custom_drawer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuizSubmissionPage extends HookWidget {
  static String get path => "/quiz-submission";

  static String get name => "quiz-submission";

  final String quizId;
  final String quizStatus;

  const QuizSubmissionPage({
    super.key,
    required this.quizId,
    required this.quizStatus
  });

  @override
  Widget build(BuildContext context) {
    final subjectDetailsBloc = context.read<SubjectDetailsBloc>();

    void getQuizQuestionsList() {
      subjectDetailsBloc.add(GetQuestionsList(quizId: quizId));
    }

    void quizSubmit() {
      if (subjectDetailsBloc.state.selectedAnswerEntities.isEmpty) {
        ToastNotifications.showErrorToast(
          title: "Not Given Answer",
          message: "You should give at lest 1 answer.",
          alignment: Alignment.topCenter,
        );
        return;
      }
      int? studentId = context
          .read<AuthBloc>()
          .state
          .signInEntity
          ?.signInData
          ?.student
          ?.id;
      if (studentId != null) {
        subjectDetailsBloc.add(
          QuizSubmit(studentId: studentId.toString(), quizId: quizId),
        );
      }
    }

    useEffect(() {
      Future.microtask(() => getQuizQuestionsList());
      return null;
    }, []);

    return BlocConsumer<SubjectDetailsBloc, SubjectDetailsState>(
      listenWhen: (previous, current)=> previous.quizSubmissionStatus.isLoading,
      listener: (context, state) {
        if(state.quizSubmissionStatus.isSuccess){
          ToastNotifications.showSuccessToast(
              "Quiz successfully submit.",
            alignment: Alignment.topCenter
          );
          Navigator.pop(context);
        }if(state.quizSubmissionStatus.isError){
          ToastNotifications.showErrorToast(
            title: "Failed Try Again.",
            message: "Quiz isn't submitted successfully. Please try again!",
            alignment: Alignment.topCenter
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          endDrawer: CustomDrawer(),
          body: BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
            builder: (context, state) {
              QuestionsData? questionData =
                  state.questionsListEntity?.questionsData;
              return SafeArea(
                child: SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: Column(
                    children: [
                      const SecondaryAppBar(title: "Quiz Submission"),

                      gap12,

                      Expanded(
                        child: Container(
                          width: 1.sw,
                          height: 1.sh,
                          padding: paddingH24,
                          child: Column(
                            crossAxisAlignment: crossCenter,
                            children: [
                              Skeletonizer(
                                enabled: state.status.isLoading,
                                child: SubmissionHeader(
                                  title: questionData?.title ?? "",
                                  totalMarks: (questionData?.totalMarks ?? 0)
                                      .floor(),
                                  endTime: DateTimeFormatters.timeToDateTime(
                                    date: questionData?.quizDate,
                                    time: questionData?.endTime ,
                                  ),
                                ),
                              ),

                              gap12,

                              Text(
                                "Questions",
                                style: AppTextStyles.titleLarge.copyWith(
                                  color: AppColors.deepOrange,
                                ),
                              ),

                              Divider(thickness: 2.w),

                              McqListView(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
            builder: (context, state) {
              QuestionsData? questionData = state.questionsListEntity?.questionsData;
              if(quizStatus != "SUBMITTED" && DateTimeFormatters.isTimeValid(
                date: questionData?.quizDate,
                targetTime: questionData?.endTime ,
              )) {
                return Container(
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
                      ),
                    ],
                  ),
                  child: Center(
                    child: PrimaryButton(
                      isLoading: state.quizSubmissionStatus.isLoading,
                      onPressed: quizSubmit,
                      text: "Submit",
                      background: AppColors.deepOrange,
                      textColor: Colors.white,
                    ),
                  ),
                );
              }else {
                return SizedBox.shrink();
              }
            }
          ),
        );
      },
    );
  }
}
