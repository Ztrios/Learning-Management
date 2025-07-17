import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/home/presentation/widgets/item_view/subject_item_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/lessions_page.dart';

class SubjectListWidget extends HookWidget {
  const SubjectListWidget({super.key});

  @override
  Widget build(BuildContext context) {

    const List<String> subjects = [
      "Bangla",
      "English",
      "Mathematics",
      "Geography",
      "History"
    ];

    const List<Color> colors = [
      AppColors.deepOrange,
      AppColors.deepBlue,
      AppColors.deepGreen,
      AppColors.tealBlue,
      AppColors.deepPurpleAccent
    ];


    const Map<String,dynamic> icons = {
      "bangla": "assets/icons/bangla_icon.svg",
      "english": "assets/icons/english_icon.svg",
      "mathematics": "assets/icons/mathematics_icon.svg",
      "geography": "assets/icons/geography_icon.svg",
      "history": "assets/icons/history_icon.svg",
    };



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
              itemCount: subjects.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Map<String, String> parameters = {
                      "subject": subjects[index],
                      "subjectIcon": icons[subjects[index].toLowerCase()]
                    };
                    context.push(
                        Uri(path: LessionsPage.path, queryParameters: parameters).toString(),
                        extra: LessionPageExtraParams(
                          background: colors[index % colors.length].withValues(alpha: 0.9),
                          shapeColor: colors[index % colors.length],
                        )
                    );
                  },

                  child: SubjectItemView(
                    subject: subjects[index],
                    svgIcon: icons[subjects[index].toLowerCase()],
                    background: colors[index % colors.length].withValues(alpha: 0.9),
                    shapeColor: colors[index % colors.length],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
