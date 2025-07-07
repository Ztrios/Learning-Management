import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/results/presentation/widgets/result_graph.dart';

class ResultsCard extends StatelessWidget {
  final List<Results> results;
  const ResultsCard({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: padding24,
      decoration: BoxDecoration(
        borderRadius: radius16,
        color: AppColors.deepGreen,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            spacing: 15.w,
            children: [
              SvgPicture.asset("assets/icons/graph_icon.svg"),
              Text(
                "Result graph",
                style: AppTextStyles.headlineSmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          gap6,
          Text(
            "The student's academic results by subject",
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
          ),
          gap6,
          SizedBox(
            width: 1.sw,
            child: ResultBarChart(results: results),
          ),
        ],
      ),
    );
  }
}