import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_event.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/assignment_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/exams_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/cards/quiz_progress_card.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_header_widget.dart';
import 'package:learning_management/features/progress/presentation/widgets/tab_bar/progress_tab_bar.dart';
import 'package:learning_management/features/results/presentation/bloc/results_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_event.dart';
import 'package:learning_management/widgets/app_bars/primary_app_bars.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      AssignmentProgressCard(),
    ];

    void getStudentProgress(){
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<ProgressBloc>().add(GetStudentProgress(studentId: studentId.toString()));
        context.read<ResultsBloc>().add(GetStudentResults(studentId: studentId.toString()));
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
        color: AppColors.background,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              PrimaryAppBar(),

              gap24,

              Padding(
                padding: paddingH20,
                child: Column(
                  children: [
                    BlocBuilder<ResultsBloc, ResultsState>(
                      builder: (context, state) {
                        return Skeletonizer(
                          enabled: state.status.isLoading,
                          child: StatsHeader(
                            grade: state.resultsEntity?.resultsData?.overallGrade ?? "0.00",
                            totalRank: (state.resultsEntity?.resultsData?.standardRank ?? 00).toString(),
                            classRank: (state.resultsEntity?.resultsData?.sectionRank ?? 00).toString(),
                            background: selectedIndex.value == 0
                                ? AppColors.blueLight
                                : selectedIndex.value == 1 ?
                            AppColors.deepPurpleAccent : AppColors.tealBlue,
                          ),
                        );
                      },
                    ),

                    BlocBuilder<ProgressBloc, ProgressState>(
                      builder: (context, state) {
                        return Skeletonizer(
                          enabled: state.status.isLoading,
                          child: Column(
                            children: [
                              ProgressTabBar(
                                selectedIndex: selectedIndex.value,
                                tabs: ["Exams", "Quiz", "Assignment"],
                                onChanged: (int value) => selectedIndex.value = value,
                              ),
                              progressCads[selectedIndex.value],
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}



