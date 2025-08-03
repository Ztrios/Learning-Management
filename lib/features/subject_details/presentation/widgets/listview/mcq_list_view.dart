import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/subject_details/data/models/questions_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/widgets/item_view/mcq_item_view.dart';
import 'package:learning_management/widgets/circle_loading.dart';
import 'package:learning_management/widgets/empty_widget.dart';

class McqListView extends StatelessWidget {
  const McqListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
        builder: (context, state) {

          if(state.status.isLoading){
            return CircleLoadingWidget();
          }else if(state.status.isSuccess &&
              (state.questionsListEntity?.questionsData?.content?.questions).isNotNullAndNotEmpty
          ){
            return ListView.builder(
                itemCount: state.questionsListEntity?.questionsData?.content?.questions?.length,
                itemBuilder: (context, index) {

                  Question question = state.questionsListEntity!.questionsData!.content!.questions![index];

                  return MCQItemView(
                    questionType: question.answerType == "SINGLE" ? QuestionType.singleChoice
                        : question.answerType == "MULTIPLE" ? QuestionType.multipleChoice
                        : QuestionType.shortAnswer,
                    question: question.questionText ?? "Not Found",
                    options: question.options ?? [],
                  );
                }
            );
          }else{
            return EmptyWidget(
                title: "No Questions Found!",
                message: "Questions aren't available at this moment."
            );
          }
        },
      ),
    );
  }
}
