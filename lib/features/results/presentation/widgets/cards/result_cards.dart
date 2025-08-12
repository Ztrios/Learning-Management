import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_event.dart';
import 'package:learning_management/features/results/presentation/widgets/empty_results_widget.dart';
import 'package:learning_management/features/results/presentation/widgets/loading_widget/results_graph_loading.dart';
import 'package:learning_management/features/results/presentation/widgets/result_graph.dart';
import 'package:learning_management/widgets/empty_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ResultsCard extends HookWidget {
  const ResultsCard({super.key});

  @override
  Widget build(BuildContext context) {


    void getResults(){
      int? studentId = context.read<AuthBloc>().state.signInEntity?.signInData?.student?.id;
      if(studentId != null){
        context.read<ResultsBloc>().add(GetStudentResults(studentId: studentId.toString()));
      }
    }

    useEffect((){
      Future.microtask(()=> getResults());
      return null;
    },[]);


    return BlocBuilder<ResultsBloc, ResultsState>(
      builder: (context, state) {
        if(state.status.isLoading){
          return ResultsGraphLoading();
        }else if(state.status.isSuccess){
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
                  child: ResultBarChart(
                      subjectPerformances: state.resultsEntity?.resultsData?.subjectPerformances ?? []
                  ),
                )
              ],
            ),
          );
        }else {
          return SizedBox.shrink();
        }
      },
    );
  }
}