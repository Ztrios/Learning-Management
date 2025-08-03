import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/subject_details/data/models/assignment_details_model.dart';
import 'package:learning_management/features/subject_details/data/models/assignment_list_model.dart';
import 'package:learning_management/features/subject_details/data/models/exam_details_model.dart';
import 'package:learning_management/features/subject_details/data/models/exams_list_model.dart';
import 'package:learning_management/features/subject_details/data/models/lession_details_model.dart';
import 'package:learning_management/features/subject_details/data/models/lessions_list_model.dart';
import 'package:learning_management/features/subject_details/data/models/questions_list_model.dart';
import 'package:learning_management/features/subject_details/data/models/quiz_list_model.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/questions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/entities/quiz_list_entity.dart';

sealed class SubjectDetailsRemoteDataSource {
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId});
  Future<Either<Failure, LessionDetailsEntity>> getLessionDetails({required String lessionId});
  Future<Either<Failure, AssignmentListEntity>> getAssignmentList({required String lessionId});
  Future<Either<Failure, AssignmentDetailsEntity>> getAssignmentDetails({required String assignmentId});
  Future<Either<Failure, bool>> assignmentSubmit({required Map<String,dynamic> body});
  Future<Either<Failure, QuizListEntity>> getQuizList({required String lessionId});
  Future<Either<Failure, QuestionsListEntity>> getQuestionsList({required String quizId});
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId});
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId});
  Future<Either<Failure, bool>> submitExam({required Map<String,dynamic> body});
}



class SubjectDetailsRemoteDataSourceImpl extends SubjectDetailsRemoteDataSource{

  @override
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.subjectLessions}$subjectId/lessons-progress");
      LessionsListEntity lessionsEntity = LessionsListModel.fromJson(response.data).toEntity();
      return Right(lessionsEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, LessionDetailsEntity>> getLessionDetails({required String lessionId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.lessionDetails}$lessionId/progress");
      LessionDetailsEntity lessionDetailsEntity = LessionDetailsModel.fromJson(response.data).toEntity();
      return Right(lessionDetailsEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, AssignmentListEntity>> getAssignmentList({required String lessionId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.lessionAssignment}$lessionId/students-course-track");
      AssignmentListEntity assignmentListEntity = AssignmentListModel.fromJson(response.data).toEntity();
      return Right(assignmentListEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, AssignmentDetailsEntity>> getAssignmentDetails({required String assignmentId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.lessionAssignment}$assignmentId");
      AssignmentDetailsEntity assignmentDetailsEntity = AssignmentDetailsModel.fromJson(response.data).toEntity();
      return Right(assignmentDetailsEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, bool>> assignmentSubmit({required Map<String, dynamic> body}) async {
    try{

      Response response = await sl<DioClient>().post(
          ApiUrls.assignmentSubmit,
          options: Options(contentType: "multipart/form-data"),
          data: FormData.fromMap(body)
      );
      return Right(response.statusCode == 200);

    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, QuizListEntity>> getQuizList({required String lessionId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.lessionQuiz}$lessionId/students-course-track");
      QuizListEntity quizListEntity = QuizListModel.fromJson(response.data).toEntity();
      return Right(quizListEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, QuestionsListEntity>> getQuestionsList({required String quizId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.quizQuestions}$quizId");
      QuestionsListEntity questionsEntity = QuestionsListModel.fromJson(response.data).toEntity();
      return Right(questionsEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.subjectExams}$subjectId");
      ExamsListEntity examsListEntity = ExamsListModel.fromJson(response.data).toEntity();
      return Right(examsListEntity);
    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId}) async {
    try{

      Response response = await sl<DioClient>().get("${ApiUrls.examDetails}$examId");
      ExamDetailsEntity examDetailsEntity = ExamDetailsModel.fromJson(response.data).toEntity();
      return Right(examDetailsEntity);

    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> submitExam({required Map<String, dynamic> body}) async {
    try{

      Response response = await sl<DioClient>().post(
        ApiUrls.submitExam,
        options: Options(contentType: "multipart/form-data"),
        data: FormData.fromMap(body)
      );
      return Right(response.statusCode == 200);

    }catch(error, stackTrace){
      log(
          "Lessions Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }



}