
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/home/data/models/subjects_model.dart';
import 'package:learning_management/features/home/domain/entities/subject_entity.dart';

sealed class HomeRemoteDataSource {
  Future<Either<Failure, SubjectsEntity>> getStudentSubjects({required String studentId});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  @override
  Future<Either<Failure, SubjectsEntity>> getStudentSubjects({required String studentId}) async {
    try{
      Map<String,dynamic> queries = {"studentId" : studentId};
      Response response = await sl<DioClient>().get(
        ApiUrls.studentSubjects,
        queryParameters: queries
      );
      SubjectsEntity subjectsEntity = SubjectsModel.fromJson(response.data).toEntity();
      return Right(subjectsEntity);
    }catch(error, stackTrace){
      log(
          "auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

}