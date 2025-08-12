import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/data/models/progress_models.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_event.dart';

import '../progress_indicator_circle.dart';

class AssignmentProgressCard extends HookWidget {
  const AssignmentProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        return Container(
          padding: padding16,
          decoration: BoxDecoration(
            borderRadius: radius16,
            color: AppColors.tealBlue,
          ),
          child: Column(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainCenter,
            children: [
              _LanguageDropdown(),
              gap12,
              Text(
                "Your result ",
                style: AppTextStyles.titleLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              gap24,
              ProgressIndicatorCircle(
                percentage: state.selectedSubject?.assignmentPercentage ?? 0,
                message: "Good progress",
                progressColor: AppColors.deepOrange,
                isForQuiz: false,
              ),
              gap24,
              _StatsCards(),
            ],
          ),
        );
      },
    );
  }
}

class _LanguageDropdown extends HookWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: mainEnd,
          children: [
            Container(
              padding: paddingH12,
              decoration: BoxDecoration(
                  borderRadius: radius12,
                  color: Colors.white
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: state.selectedSubject?.subjectId,
                  icon: Icon(
                      Icons.keyboard_arrow_down, color: AppColors.deepBlue,
                      size: 25.sp),
                  dropdownColor: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  style: AppTextStyles.titleSmall.copyWith(
                      fontWeight: FontWeight.bold),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<ProgressBloc>().add(
                          SelectSubject(subjectId: value));
                    }
                  },
                  items: state.progressEntity?.subjectProgresses?.map((
                      subjectProgress) {
                    return DropdownMenuItem<int>(
                      value: subjectProgress.subjectId,
                      child: Text(
                          (subjectProgress.subjectName?.length ?? 0) > 20 ?
                          "${subjectProgress.subjectName!.substring(0,20)}..." : subjectProgress.subjectName ?? ""
                      ),                    );
                  }).toList(),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}


class _StatsCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressBloc, ProgressState>(
      builder: (context, state) {
        return Row(
          spacing: 16.w,
          children: [
            _StatCard(
              value: (state.selectedSubject?.totalAssignments ?? 00).toString(),
              label: "Total Exams",
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            _StatCard(
              value: (state.selectedSubject?.totalAssignmentSubmission ?? 00).toString(),
              label: "Completed",
              backgroundColor: AppColors.deepOrange,
              textColor: Colors.white,
              iconPath: "assets/icons/score_icon.svg",
            ),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final String? iconPath;

  const _StatCard({
    required this.value,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130.h,
        padding: padding12,
        decoration: BoxDecoration(
          borderRadius: radius16,
          color: backgroundColor,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: crossStart,
              mainAxisAlignment: mainCenter,
              children: [
                Text(
                  value,
                  style: AppTextStyles.displaySmall.copyWith(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                Text(
                  label,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w900,
                    color: textColor,
                  ),
                ),
              ],
            ),
            if (iconPath != null)
              Positioned(
                right: 10,
                child: SvgPicture.asset(
                  iconPath!,
                  width: 35.w,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
