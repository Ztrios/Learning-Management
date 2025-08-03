import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/subject_details/domain/usecases/get_quiz_list_usecase.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';
import 'package:learning_management/features/subject_details/presentation/pages/tab_view/assignments_tab_view.dart';
import 'package:learning_management/features/subject_details/presentation/pages/tab_view/content_tab_view.dart';
import 'package:learning_management/features/subject_details/presentation/pages/tab_view/materials_tab_view.dart';
import 'package:learning_management/features/subject_details/presentation/pages/tab_view/quizzes_tab_view.dart';

class LessionDetailsTabBar extends HookWidget {
  final String lessionId;
  const LessionDetailsTabBar({super.key, required this.lessionId});

  @override
  Widget build(BuildContext context) {

    void getAssignmentAndQuizList(int index){
      if(index == 2){
        context.read<SubjectDetailsBloc>().add(GetAssignmentList(lessionId: lessionId));
      }else if(index == 3){
        context.read<SubjectDetailsBloc>().add(GetQuizList(lessionId: lessionId));
      }
    }

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
            onTap: getAssignmentAndQuizList,
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
