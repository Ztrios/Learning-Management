import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/exams_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/stats_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/progress_tab_bar_widget.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_header_widget.dart';

class ProgressPage extends HookWidget {

  static String get path => "/progress";
  static String get name => "progress";
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState<int>(1);

    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        padding: padding20,
        color: AppColors.background,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              gap12,

              StatsHeader(
                grade: "3.33",
                totalRank: "1,438",
                classRank: "56",
                background: selectedIndex.value == 0
                    ? AppColors.blueLight
                    : AppColors.deepPurpleAccent,
              ),

              ProgressTabBarWidget(
                selectedIndex: selectedIndex.value,
                tabs: ["Exams", "Stats", "Details"],
                onChanged: (int value) => selectedIndex.value = value,
              ),

              if(selectedIndex.value == 0)
                ExamsProgressCard()
              else
                StatsProgressCard()


            ],
          ),
        ),
      ),
    );
  }
}



