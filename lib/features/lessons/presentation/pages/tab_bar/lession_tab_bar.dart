import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/exams_list_tab_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/lession_list_tab_view.dart';

class LessionTabBar extends StatelessWidget {
  const LessionTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.deepOrange,
            splashBorderRadius: radius6,
            labelStyle: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w900,
              color: Colors.deepOrange
            ),
            tabs: [
              Tab(text: "Lessions"),
              Tab(text: "Exams"),
            ],
          ),

          gap12,

          Expanded(
            child: TabBarView(
              children: [
                LessionListTabView(),
                ExamListTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
