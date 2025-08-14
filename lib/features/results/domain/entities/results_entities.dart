import 'package:learning_management/features/results/data/models/results_model.dart';

class ResultsEntity {
  final int? statusCode;
  final String? message;
  final ResultsData? resultsData;

  ResultsEntity({
    this.statusCode,
    this.message,
    this.resultsData,
  });

}