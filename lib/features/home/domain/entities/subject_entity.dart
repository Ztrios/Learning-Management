import 'package:learning_management/features/home/data/models/subjects_model.dart';

class SubjectsEntity {
  final int? statusCode;
  final String? message;
  final SubjectsData? subjectsData;

  SubjectsEntity({
    this.statusCode,
    this.message,
    this.subjectsData,
  });
}