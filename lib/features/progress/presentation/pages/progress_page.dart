import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_event.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/exams_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/quiz_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_header_widget.dart';
import 'package:learning_management/features/progress/presentation/widgets/tab_bar/progress_tab_bar.dart';

class ProgressPage extends HookWidget {

  static String get path => "/progress";
  static String get name => "progress";
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {


    final selectedIndex = useState<int>(1);
    const List<Widget> progressCads = [
      ExamsProgressCard(),
      QuizProgressCard(),
      ExamsProgressCard(),
    ];

    void getStudentProgress(){
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<ProgressBloc>().add(GetStudentProgress(studentId: studentId.toString()));
      }
    }

    useEffect((){
      Future.microtask(()=> getStudentProgress());
      return null;
    },[]);

    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        padding: paddingH20,
        color: AppColors.background,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              gap24,

              StatsHeader(
                grade: "3.33",
                totalRank: "1,438",
                classRank: "56",
                background: selectedIndex.value == 0
                    ? AppColors.blueLight
                    : AppColors.deepPurpleAccent,
              ),

              Column(
                children: [
                  ProgressTabBar(
                    selectedIndex: selectedIndex.value,
                    tabs: ["Exams", "Quiz", "Assignment"],
                    onChanged: (int value) => selectedIndex.value = value,
                  ),
                  progressCads[selectedIndex.value],
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}



