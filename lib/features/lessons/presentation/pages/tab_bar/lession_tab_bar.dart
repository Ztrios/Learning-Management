import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/domain/usecases/get_exams_list_usecase.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_bloc.dart';
import 'package:learning_management/features/lessons/presentation/bloc/lessions_event.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/exams_list_tab_view.dart';
import 'package:learning_management/features/lessons/presentation/pages/tab_view/lession_list_tab_view.dart';

class LessionTabBar extends HookWidget {
  final String subjectId;
  const LessionTabBar({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context) {

    void getLessionsAndExamsList(int tabIndex){
      if(tabIndex == 0){
        context.read<LessionsBloc>().add(GetLessionsList(subjectId: subjectId));
      }else{
        context.read<LessionsBloc>().add(GetExamsList(subjectId: subjectId));
      }
    }

    useEffect((){
      Future.microtask(()=> getLessionsAndExamsList(0));
      return null;
    },[]);

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
            onTap: getLessionsAndExamsList,
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
