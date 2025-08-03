import 'package:flutter/material.dart';
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
import 'package:learning_management/widgets/network_image_widget.dart';

class MCQItemView extends StatelessWidget {
  final QuestionType questionType;
 // final String? image;
  final String question;
  final List<Option>? options;
  const MCQItemView({
    super.key,
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
      child: Column(
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
          ...(options ?? []).map((option){
            return CheckboxListTile(
              value: false,
              onChanged: (value) {},
              controlAffinity: ListTileControlAffinity
                  .leading,
              title: Text(option.text ?? ""),
              activeColor: AppColors.deepGreen,
              contentPadding: padding0,
            );
          })

          else TextField(
            minLines: 3,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Write your answer...",
              border: OutlineInputBorder(
              )
            ),
          )



        ],
      ),
    );
  }
}
