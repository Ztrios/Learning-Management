import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_widget.dart';
import 'package:learning_management/widgets/custom_divider.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding20,
        child: Column(
          children: [

            gap24,
      
            Container(
              width: 1.sw,
              padding: padding20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
               borderRadius: radius24,
               color: AppColors.deepPurpleAccent
              ),
              child: Row(
                mainAxisAlignment: mainSpaceAround,
                children: [

                  StatsWidget(
                      svgIcon: "assets/icons/star_icon.svg",
                      title: "GRADE",
                      value: "3.30"
                  ),

                  CustomDivider(
                      height: 80.h
                  ),

                  StatsWidget(
                      svgIcon: "assets/icons/language_icon.svg",
                      title: "TOTAL RANK",
                      value: "14,326"
                  ),

                  CustomDivider(
                      height: 80.h
                  ),

                  StatsWidget(
                      svgIcon: "assets/icons/rank_icon.svg",
                      title: "CLASS RANK",
                      value: "56"
                  ),




                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}
