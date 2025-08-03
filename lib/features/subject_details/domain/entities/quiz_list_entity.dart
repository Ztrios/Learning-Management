import 'package:learning_management/features/subject_details/data/models/quiz_list_model.dart';

class QuizListEntity {
  final int? statusCode;
  final String? message;
  final List<Quiz>? quizzes;

  QuizListEntity({
    this.statusCode,
    this.message,
    this.quizzes,
  });
}