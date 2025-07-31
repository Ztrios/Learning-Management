import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/lessons/data/datasource/remote_datasource/lessions_remote_datasouce.dart';
import 'package:learning_management/features/lessons/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/quiz_list_entity.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';

class LessionsRepositoriesImpl implements LessionsRepositories{
  @override
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId}) async =>
      await sl<LessionsRemoteDataSource>().getLessionsList(subjectId: subjectId);

  @override
  Future<Either<Failure, LessionDetailsEntity>> getLessionDetails({required String lessionId}) async =>
      await sl<LessionsRemoteDataSource>().getLessionDetails(lessionId: lessionId);

  @override
  Future<Either<Failure, QuizListEntity>> getQuizList({required String lessionId}) async =>
      await sl<LessionsRemoteDataSource>().getQuizList(lessionId: lessionId);

  @override
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId}) async =>
      await sl<LessionsRemoteDataSource>().getExamsList(subjectId: subjectId);

  @override
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId}) async =>
      await sl<LessionsRemoteDataSource>().getExamsDetails(examId: examId);

  @override
  Future<Either<Failure, bool>> submitExam({required Map<String, dynamic> body}) async =>
      await sl<LessionsRemoteDataSource>().submitExam(body: body);

  @override
  Future<Either<Failure, AssignmentListEntity>> getAssignmentList({required String lessionId}) async =>
      await sl<LessionsRemoteDataSource>().getAssignmentList(lessionId: lessionId);



}