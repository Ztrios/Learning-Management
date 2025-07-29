import 'package:learning_management/features/profile/data/models/student_profile_model.dart';

class StudentProfileEntity {
  final int? statusCode;
  final String? message;
  final Profile? profile;

  StudentProfileEntity({
    this.statusCode,
    this.message,
    this.profile,
  });
}