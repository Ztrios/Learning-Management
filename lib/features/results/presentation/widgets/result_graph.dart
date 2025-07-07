import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultBarChart extends StatelessWidget {
  final List<Results> results;
  const ResultBarChart({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
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
        ColumnSeries<Results, String>(
          dataSource: results,
          width: 0.7,
          borderRadius: BorderRadius.circular(8),
          xValueMapper: (res, _) => res.subject,
          yValueMapper: (res, _) => res.marks,
          pointColorMapper: (res, _) => res.color,
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
    );
  }
}

class Results {
  final String subject;
  final int marks;
  final Color color;

  const Results({
    required this.subject,
    required this.marks,
    required this.color,
  });
}
