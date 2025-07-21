import 'package:learning_management/features/authentication/data/models/sign_in_model.dart';

class SectionsEntity {
  final int? id;
  final String? sectionName;
  final String? yearBatch;
  final Standard? standard;

  SectionsEntity({
    this.id,
    this.sectionName,
    this.yearBatch,
    this.standard,
  });
}