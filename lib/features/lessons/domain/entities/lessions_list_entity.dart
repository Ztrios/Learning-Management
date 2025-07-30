import 'package:learning_management/features/lessons/data/models/lessions_list_model.dart';

class LessionsListEntity {
  final int? statusCode;
  final String? message;
  final LessionsData? lessionsData;

  LessionsListEntity({
    this.statusCode,
    this.message,
    this.lessionsData,
  });
}