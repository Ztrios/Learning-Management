import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/progress/data/models/progress_models.dart';
import 'package:learning_management/features/progress/domain/entities/progress_entities.dart';

sealed class ProgressRemoteDataSource {
  Future<Either<Failure, ProgressEntity>> getStudentProgress({required String studentId});

}

class ProgressRemoteDatasourceImpl implements ProgressRemoteDataSource{
  @override
  Future<Either<Failure, ProgressEntity>> getStudentProgress({required String studentId}) async {
    try{

      Response response = await sl<DioClient>().get("${ApiUrls.studentResults}$studentId/subjects-performance");
      ProgressEntity progressEntity = ProgressModel.fromJson(response.data).toEntity();
      return Right(progressEntity);

    }catch(error, stackTrace){
      log(
          "Progress Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }
}