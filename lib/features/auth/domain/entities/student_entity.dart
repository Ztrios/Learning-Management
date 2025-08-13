import 'package:learning_management/features/auth/data/models/student_model.dart';

class StudentEntity {
  final int? statusCode;
  final String? message;
  final Student? student;

  StudentEntity({
    this.statusCode,
    this.message,
    this.student,
  });
}
