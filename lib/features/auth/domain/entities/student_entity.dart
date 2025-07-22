import 'package:learning_management/features/auth/data/models/student_model.dart';

class StudentEntity {
  final int? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? phone;
  final String? imageDeletePath;
  final String? imagePath;
  final String? gender;
  final String? address;
  final String? rollNumber;
  final String? fathersName;
  final String? mothersName;
  final String? emergencyContact;
  final String? remarks;
  final String? deviceId;
  final DateTime? deviceExpTime;
  final String? prevClassGrade;
  final Section? section;
  final DateTime? enrollmentDate;
  final bool? isRegistrationDone;
  final DateTime? subscriptionExpiry;

  StudentEntity({
    this.id,
    this.username,
    this.email,
    this.fullName,
    this.phone,
    this.imageDeletePath,
    this.imagePath,
    this.gender,
    this.address,
    this.rollNumber,
    this.fathersName,
    this.mothersName,
    this.emergencyContact,
    this.remarks,
    this.deviceId,
    this.deviceExpTime,
    this.prevClassGrade,
    this.section,
    this.enrollmentDate,
    this.isRegistrationDone,
    this.subscriptionExpiry,
  });
}