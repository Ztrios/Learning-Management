// 📁 File: results_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/features/results/presentation/widgets/cards/result_cards.dart';
import 'package:learning_management/features/results/presentation/widgets/result_graph.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/progress/presentation/widgets/stats_header_widget.dart';

class ResultsPage extends HookWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final results = useState<List<Results>>([
      const Results(subject: "English", marks: 70, color: Colors.red),
      const Results(subject: "Bangla", marks: 50, color: Colors.yellow),
      const Results(subject: "Geography", marks: 63, color: Colors.pink),
      const Results(subject: "History", marks: 55, color: Colors.white),
    ]);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: padding20,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                gap12,
                const StatsHeader(
                  grade: "3.33",
                  totalRank: "1,438",
                  classRank: "56",
                  background: AppColors.deepGreen,
                ),
                gap48,
                ResultsCard(results: results.value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



