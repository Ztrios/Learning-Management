import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/lessons/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';

abstract class LessionsRepositories {
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId});
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId});
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId});
}