import 'package:learning_management/features/lessons/data/models/assignment_details_model.dart';

class AssignmentDetailsEntity {
  final int? statusCode;
  final String? message;
  final AssignmentDetails? assignmentDetails;

  AssignmentDetailsEntity({
    this.statusCode,
    this.message,
    this.assignmentDetails,
  });
}