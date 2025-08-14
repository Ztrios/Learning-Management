import 'package:learning_management/features/subject_details/data/models/lession_details_model.dart';

class LessionDetailsEntity {
  final int? statusCode;
  final String? message;
  final LessionDetails? lessionDetails;

  LessionDetailsEntity({
    this.statusCode,
    this.message,
    this.lessionDetails,
  });
}