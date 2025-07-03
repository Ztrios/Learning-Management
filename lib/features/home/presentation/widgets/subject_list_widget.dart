import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/subject_item_view.dart';

class SubjectListWidget extends StatelessWidget {
  const SubjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [

        Text(
          "Subjects",
          style: AppTextStyles.titleLarge.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),

        Text(
          "Recommendations for you",
          style: AppTextStyles.caption,
        ),

        gap12,

        SizedBox(
          width: 1.sw,
          height: 120.h,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SubjectItemView(
                  svgIcon: "assets/icons/mathematics_icon.svg",
                  subject: "Mathematics",
                  background: AppColors.deepOrange,
                  shapeColor: AppColors.lightOrange
                );
              }
          ),
        ),
      ],
    );
  }
}
