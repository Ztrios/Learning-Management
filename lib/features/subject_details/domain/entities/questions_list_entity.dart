import 'package:learning_management/features/subject_details/data/models/questions_list_model.dart';

class QuestionsListEntity {
  final int? statusCode;
  final String? message;
  final QuestionsData? questionsData;

  QuestionsListEntity({
    this.statusCode,
    this.message,
    this.questionsData,
  });
}