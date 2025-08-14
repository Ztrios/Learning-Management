import 'package:learning_management/features/home/data/models/todays_class_model.dart';

class TodaysClassEntity {
  final int? statusCode;
  final String? message;
  final ClassData? classData;

  TodaysClassEntity({
    this.statusCode,
    this.message,
    this.classData,
  });
}