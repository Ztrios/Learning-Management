import 'package:learning_management/features/subject_details/data/models/assignment_list_model.dart';

class AssignmentListEntity {
  final int? statusCode;
  final String? message;
  final List<Assignment>? assignments;

  AssignmentListEntity({
    this.statusCode,
    this.message,
    this.assignments,
  });
}