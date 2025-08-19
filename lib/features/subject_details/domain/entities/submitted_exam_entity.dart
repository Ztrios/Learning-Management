import 'package:learning_management/features/subject_details/data/models/submitted_exam_model.dart';

class SubmittedExamEntity {
  final int? statusCode;
  final String? message;
  final SubmittedExamData? submittedExamData;

  SubmittedExamEntity({
    this.statusCode,
    this.message,
    this.submittedExamData,
  });
}