import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/lessons/data/models/exam_details_model.dart';
import 'package:learning_management/features/lessons/data/models/exams_list_model.dart';
import 'package:learning_management/features/lessons/data/models/lessions_list_model.dart';
import 'package:learning_management/features/lessons/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';

sealed class LessionsRemoteDataSource {
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId});
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId});
  Future<Either<Failure, ExamDetailsEntity>> getExamsDetails({required String examId});
  Future<Either<Failure, bool>> submitExam({required Map<String,dynamic> body});
}



class LessionsRemoteDataSourceImpl extends LessionsRemoteDataSource{

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