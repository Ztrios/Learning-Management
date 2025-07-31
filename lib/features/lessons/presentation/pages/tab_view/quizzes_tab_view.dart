import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/lessons/data/models/quiz_list_model.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_bloc.dart';
import 'package:learning_management/features/lessons/presentation/pages/lession_details_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';
import 'package:learning_management/features/lessons/presentation/pages/quiz_submission_page.dart';
import 'package:learning_management/features/lessons/presentation/widgets/item_view/quizzes_item_view.dart';
import 'package:learning_management/features/lessons/presentation/widgets/loading/lessions_list_loading.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class QuizzesTabView extends StatelessWidget {
  const QuizzesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessionsBloc, LessionsState>(
      builder: (context, state) {

        if(state.status.isLoading){
          return LessionsListLoading();
        }else if(state.status.isSuccess && (state.quizListEntity?.quizzes).isNotNullAndNotEmpty){
          return ListView.builder(
              itemCount: state.quizListEntity?.quizzes?.length,
              itemBuilder: (context, index) {

                Quiz quiz = state.quizListEntity!.quizzes![index];

                return InkWell(
                  onTap: () =>
                      context.push(LessionsPage.path + LessionDetailsPage.path +
                          QuizSubmissionPage.path),
                  child: QuizzesItemView(
                    totalMarks: quiz.totalMarks ?? 0,
                    getMarks: quiz.earnedMarks ?? 0,
                    title: quiz.title ?? "",
                    isCompleted: quiz.status == "SUBMITTED",
                    status: quiz.status ?? "UPCOMING",
                  ),
                );
              }
          );
        }else{
          return EmptyWidget(
              title: "No Quiz found!",
              message: "Quizzes are not available at this moment."
          );
        }

      },
    );
  }
}
