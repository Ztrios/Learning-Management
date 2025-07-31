import 'package:learning_management/features/lessons/data/models/assignment_list_model.dart';

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