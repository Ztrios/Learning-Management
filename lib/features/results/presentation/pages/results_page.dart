// 📁 File: results_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_event.dart';
import 'package:learning_management/features/results/presentation/widgets/cards/result_cards.dart';
import 'package:learning_management/features/results/presentation/widgets/result_graph.dart';
import 'package:learning_management/widgets/app_bars/primary_app_bars.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_header_widget.dart';

class ResultsPage extends HookWidget {
  static String get path => "/results";

  static String get name => "results";

  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        color: AppColors.background,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

              PrimaryAppBar(),

              gap12,

              Padding(
                padding: padding20,
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
                            background: AppColors.deepGreen,
                          ),
                        );
                      },
                    ),

                    gap48,

                    ResultsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



