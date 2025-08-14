import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_widget.dart';
import 'package:learning_management/widgets/custom_divider.dart';

class StatsHeader extends StatelessWidget {
  final String grade;
  final String totalRank;
  final String classRank;
  final Color background;

  const StatsHeader({
    super.key,
    required this.grade,
    required this.totalRank,
    required this.classRank,
    required this.background
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: padding20,
      decoration: BoxDecoration(
        borderRadius: radius24,
        color: background,
      ),
      duration: Duration(microseconds: 700),
      child: Row(
        mainAxisAlignment: mainSpaceAround,
        children: [

          gap6,

          StatsWidget(
            svgIcon: "assets/icons/star_icon.svg",
            title: "GRADE",
            value: grade,
          ),

          gap12,

          CustomDivider(height: 80.h),

          gap6,

          StatsWidget(
            svgIcon: "assets/icons/language_icon.svg",
            title: "TOTAL RANK",
            value: totalRank,
          ),

          gap2,

          CustomDivider(height: 80.h),


          StatsWidget(
            svgIcon: "assets/icons/rank_icon.svg",
            title: "CLASS RANK",
            value: classRank,
          ),
        ],
      ),
    );
  }
}