import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/lessons/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/quiz_list_entity.dart';

abstract class LessionsRepositories {
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId});
  Future<Either<Failure, LessionDetailsEntity>> getLessionDetails({required String lessionId});
  Future<Either<Failure, AssignmentListEntity>> getAssignmentList({required String lessionId});
  Future<Either<Failure, QuizListEntity>> getQuizList({required String lessionId});
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId});
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId});
  Future<Either<Failure, bool>> submitExam({required Map<String,dynamic> body});

}