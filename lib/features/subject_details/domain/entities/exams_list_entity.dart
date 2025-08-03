import 'package:learning_management/features/subject_details/data/models/exams_list_model.dart';

class ExamsListEntity {
  final int? statusCode;
  final String? message;
  final List<Exam>? exams;

  ExamsListEntity({
    this.statusCode,
    this.message,
    this.exams,
  });
}