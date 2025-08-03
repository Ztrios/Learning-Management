import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/subject_details/data/datasource/remote_datasource/subject_details_remote_datasource.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/questions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/quiz_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/repositories/subject_details_repositories.dart';

class SubjectDetailsRepositoriesImpl implements SubjectDetailsRepositories{
  @override
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getLessionsList(subjectId: subjectId);

  @override
  Future<Either<Failure, LessionDetailsEntity>> getLessionDetails({required String lessionId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getLessionDetails(lessionId: lessionId);

  @override
  Future<Either<Failure, QuizListEntity>> getQuizList({required String lessionId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getQuizList(lessionId: lessionId);

  @override
  Future<Either<Failure, QuestionsListEntity>> getQuestionsList({required String quizId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getQuestionsList(quizId: quizId);

  @override
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getExamsList(subjectId: subjectId);

  @override
  Future<Either<Failure, AssignmentListEntity>> getAssignmentList({required String lessionId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getAssignmentList(lessionId: lessionId);

  @override
  Future<Either<Failure, AssignmentDetailsEntity>> getAssignmentDetails({required String assignmentId}) async =>
      await sl<SubjectDetailsRepositories>().getAssignmentDetails(assignmentId: assignmentId);

  @override
  Future<Either<Failure, bool>> assignmentSubmit({required Map<String, dynamic> body}) async =>
      await sl<SubjectDetailsRepositories>().assignmentSubmit(body: body);

  @override
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId}) async =>
      await sl<SubjectDetailsRemoteDataSource>().getExamsDetails(examId: examId);

  @override
  Future<Either<Failure, bool>> submitExam({required Map<String, dynamic> body}) async =>
      await sl<SubjectDetailsRemoteDataSource>().submitExam(body: body);



}