import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/results/data/models/results_model.dart';
import 'package:learning_management/features/results/domain/entities/results_entities.dart';

sealed class ResultsRemoteDatasource {
  Future<Either<Failure, ResultsEntity>> getStudentResults({required String studentId});
}

class ResultsRemoteDatasourceImpl extends ResultsRemoteDatasource{

  @override
  Future<Either<Failure, ResultsEntity>> getStudentResults({required String studentId}) async {
    try{
      Response response = await sl<DioClient>().get("${ApiUrls.studentResults}$studentId/performance");
      ResultsEntity resultsEntity = ResultsModel.fromJson(response.data).toEntity();
      return Right(resultsEntity);
    }catch(error, stackTrace){
      log(
          "Results Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


}