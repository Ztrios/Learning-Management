import 'package:flutter/material.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/assignments_tab_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/content_tab_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/materials_tab_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/quizzes_tab_view.dart';

class LessionContentTabBar extends StatelessWidget {
  const LessionContentTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Column(
        children: [

          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            physics: BouncingScrollPhysics(),
            indicatorColor: AppColors.deepOrange,
            splashBorderRadius: radius6,
            labelStyle: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w900,
                color: Colors.deepOrange
            ),
            tabs: [
              Tab(text: "Content"),
              Tab(text: "Materials"),
              Tab(text: "Assignment"),
              Tab(text: "Quizzes"),
            ],
          ),

          gap12,

          Expanded(
            child: TabBarView(
              children: [
                ContentTabView(),
                MaterialsTabView(),
                AssignmentsTabView(),
                QuizzesTabView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
