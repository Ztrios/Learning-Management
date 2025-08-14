import 'package:learning_management/features/subject_details/data/models/exam_details_model.dart';

class ExamDetailsEntity {
  final int? statusCode;
  final String? message;
  final ExamDetails? examDetails;

  ExamDetailsEntity({
    this.statusCode,
    this.message,
    this.examDetails,
  });
}