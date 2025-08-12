import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/core/utils/extensions/null_empty_extension.dart';
import 'package:learning_management/features/home/data/models/subjects_model.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/results/data/models/results_model.dart';
import 'package:learning_management/features/results/presentation/widgets/empty_results_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultBarChart extends StatelessWidget {
  final List<SubjectPerformance> subjectPerformances;

  ResultBarChart({super.key, required this.subjectPerformances});

  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.pink,
    Colors.white
  ];

  Color getRandomColors() {
    return colors[Random().nextInt(colors.length)];
  }

  SubjectPerformance? getSubjectResult(int? subjectId) {
    if(subjectId == null) return null;
    return subjectPerformances.singleWhereOrNull((subjectPerformance)=> subjectPerformance.subjectId == subjectId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

          if(subjectPerformances.isNotNullAndNotEmpty){
            return SfCartesianChart(
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
                ColumnSeries<Content, String>(
                  dataSource: state.subjectsEntity?.subjectsData?.content,
                  width: 0.7,
                  borderRadius: BorderRadius.circular(8),
                  xValueMapper: (res, _) => res.name,
                  yValueMapper: (res, _) => getSubjectResult(res.id)?.percentage ?? 0,
                  pointColorMapper: (res, _) => getRandomColors(),
                  dataLabelMapper: (res, _) => "${getSubjectResult(res.id)?.percentage ?? 0}%",
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
            );
          }else{
            return EmptyResultsWidget();
          }
      },
    );
  }
}
