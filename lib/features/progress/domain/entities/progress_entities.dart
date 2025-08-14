import 'package:learning_management/features/progress/data/models/progress_models.dart';

class ProgressEntity {
  final int? statusCode;
  final String? message;
  final List<SubjectProgress>? subjectProgresses;

  ProgressEntity({
    this.statusCode,
    this.message,
    this.subjectProgresses,
  });
}