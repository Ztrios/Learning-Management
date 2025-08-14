import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/questions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/quiz_list_entity.dart';

abstract class SubjectDetailsRepositories {
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId});
  Future<Either<Failure, LessionDetailsEntity>> getLessionDetails({required String lessionId});
  Future<Either<Failure, AssignmentListEntity>> getAssignmentList({required String lessionId});
  Future<Either<Failure, AssignmentDetailsEntity>> getAssignmentDetails({required String assignmentId});
  Future<Either<Failure, bool>> assignmentSubmit({required Map<String,dynamic> body});
  Future<Either<Failure, QuizListEntity>> getQuizList({required String lessionId});
  Future<Either<Failure, QuestionsListEntity>> getQuestionsList({required String quizId});
  Future<Either<Failure, bool>> quizSubmit({required Map<String,dynamic> body});
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId});
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId});
  Future<Either<Failure, bool>> submitExam({required Map<String,dynamic> body});

}