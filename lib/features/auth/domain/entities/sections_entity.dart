import 'package:learning_management/features/auth/data/models/sections_model.dart';

class SectionsEntity {
  final int? statusCode;
  final String? message;
  final SectionsData? sectionsData;

  SectionsEntity({
    this.statusCode,
    this.message,
    this.sectionsData,
  });

}