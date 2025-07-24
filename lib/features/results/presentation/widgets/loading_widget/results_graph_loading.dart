import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/core/utils/ui_helpers/ui_helpers.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultsGraphLoading extends StatelessWidget {
  const ResultsGraphLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
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
              child: ResultBarChartLoading(
                  results: [
                    const DummyResult(subject: "English", marks: 70, color: Colors.red),
                    const DummyResult(subject: "Bangla", marks: 50, color: Colors.yellow),
                    const DummyResult(subject: "Geography", marks: 63, color: Colors.pink),
                    const DummyResult(subject: "History", marks: 55, color: Colors.white),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class ResultBarChartLoading extends StatelessWidget {
  final List<DummyResult> results;
  const ResultBarChartLoading({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          axisLine: const AxisLine(width: 0),
          labelStyle: const TextStyle(color: Colors.white),
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
          minimum: 0,
          maximum: 100,
        ),
        series: [
          ColumnSeries<DummyResult, String>(
            dataSource: results,
            width: 0.7,
            borderRadius: BorderRadius.circular(8),
            xValueMapper: (res, _) => res.subject,
            yValueMapper: (res, _) => res.marks,
            pointColorMapper: (res, _) => Colors.white,
            dataLabelMapper: (res, _) => "${res.marks.toInt()}%",
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              labelAlignment: ChartDataLabelAlignment.outer,
            ),
          )
        ],
      ),
    );
  }
}

class DummyResult {
  final String subject;
  final int marks;
  final Color color;

  const DummyResult({
    required this.subject,
    required this.marks,
    required this.color,
  });
}