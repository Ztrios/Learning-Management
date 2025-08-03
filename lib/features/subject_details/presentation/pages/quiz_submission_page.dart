import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
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

  const QuizSubmissionPage({
    super.key,
    required this.quizId,
  });

  @override
  Widget build(BuildContext context) {
    void getQuizQuestionsList() {
      context.read<SubjectDetailsBloc>().add(GetQuestionsList(quizId: quizId));
    }

    useEffect(() {
      Future.microtask(() => getQuizQuestionsList());
      return null;
    }, []);

    return Scaffold(
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [

              const SecondaryAppBar(
                title: "Quiz Submission",
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

                      BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
                        builder: (context, state) {

                          QuestionsData? questionData = state.questionsListEntity?.questionsData;

                          return Skeletonizer(
                            enabled: state.status.isLoading,
                            child: SubmissionHeader(
                                title: questionData?.title ?? "",
                                totalMarks: (questionData?.totalMarks ?? 0).floor(),
                                endTime: DateTimeFormatters.timeToDateTime(questionData?.endTime ?? "12:94:29")
                            ),
                          );
                        },
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
            onPressed: () {},
            text: "Submit",
            background: AppColors.deepOrange,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
