import 'package:learning_management/features/auth/data/models/standards_model.dart';

class StandardsEntity {
  final int? statusCode;
  final String? message;
  final StandardsData? standardsData;

  StandardsEntity({
    this.statusCode,
    this.message,
    this.standardsData,
  });
}