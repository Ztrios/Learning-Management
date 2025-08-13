import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/features/subject_details/data/models/lessions_list_model.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';


class HeaderCard extends StatelessWidget {
  final String subject;
  final String subjectIcon;
  final Color shapeColor;
  final Color background;

  const HeaderCard({
    super.key,
    required this.subject,
    required this.subjectIcon,
    required this.shapeColor,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius16,
      child: Stack(
        children: [
          Container(
            width: 1.sw,
            //height: 130.h,
            padding: padding16,
            color: background,
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ProgressSummary()

              ],
            ),
          ),
          Positioned(
            top: -50,
            right: -25,
            child: SvgPicture.asset(
              "assets/images/draw_shape.svg",
              colorFilter: ColorFilter.mode(shapeColor, BlendMode.srcIn),
            ),
          ),
          Positioned(
            right: 30,
            top: 30,
            child: SvgPicture.asset(
                subjectIcon,
                width: 30.w,
                height: 30.w
            ),
          ),
        ],
      ),
    );
  }
}


class ProgressSummary extends StatelessWidget {
  const ProgressSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectDetailsBloc, SubjectDetailsState>(
      builder: (context, state) {
        LessionsData? lessionsData = state.lessionsListEntity?.lessionsData;
        return Skeletonizer(
          enabled: state.status.isLoading,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              Text("${lessionsData?.lessonComplete}/${lessionsData?.totalLessons} Lessons",
                  style: AppTextStyles.caption.copyWith(color: Colors.white)),
              Text("${lessionsData?.assignmentComplete}/${lessionsData?.totalAssignments} Assignments",
                  style: AppTextStyles.caption.copyWith(color: Colors.white)),
              Text("${lessionsData?.quizComplete}/${lessionsData?.totalQuizzes} Quizzes",
                  style: AppTextStyles.caption.copyWith(color: Colors.white)),
            ],
          ),
        );
      },
    );
  }
}

