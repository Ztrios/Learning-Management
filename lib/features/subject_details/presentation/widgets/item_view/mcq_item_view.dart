import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:learning_management/core/utils/extensions/question_type_extenstion.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/margins.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/subject_details/data/models/questions_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';
import 'package:learning_management/widgets/network_image_widget.dart';

class MCQItemView extends StatelessWidget {
  // final String? image;
  final int questionId;
  final String question;
  final List<Option>? options;
  final QuestionType questionType;

  const MCQItemView({
    super.key,
    required this.questionId,
    required this.questionType,
    //required this.image,
    required this.options,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: marginV6,
      padding: padding12,
      decoration: BoxDecoration(
          borderRadius: radius12,
          border: Border.all(
              color: AppColors.deepOrange
          )
      ),
      child: BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: crossStart,
            children: [

              Text(
                "• $question",
                style: AppTextStyles.titleSmall.copyWith(
                    fontWeight: FontWeight.w900
                ),
              ),
              //
              // if(image != null)
              //   NetworkImageWidget(
              //     image ?? "",
              //   ),

              gap16,

              if(!questionType.isShortAnswer)
                ...List.generate(options?.length ?? 0, (index) {

                  bool isSelected = state.selectedAnswerEntities.any((answer) =>
                      answer.questionId == questionId
                      && answer.selectedOptionIndexes != null
                      && answer.selectedOptionIndexes!.contains(index));

                  return CheckboxListTile(
                    value: isSelected,
                    onChanged: (value) {
                      context.read<SubjectDetailsBloc>().add(SelectOrUpdateAnswer(
                          questionId: questionId,
                          questionType: questionType,
                          selectedIndex: index
                      ));
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(options?[index].text ?? ""),
                    activeColor: AppColors.deepGreen,
                    contentPadding: padding0,
                  );
                })

              else
                TextField(
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "Write your answer...",
                      border: OutlineInputBorder(
                      )
                  ),
                  onChanged: (value){
                    context.read<SubjectDetailsBloc>().add(SelectOrUpdateAnswer(
                        questionId: questionId,
                        questionType: questionType,
                        writtenAnswer: value
                    ));
                  },
                )


            ],
          );
        },
      ),
    );
  }
}
