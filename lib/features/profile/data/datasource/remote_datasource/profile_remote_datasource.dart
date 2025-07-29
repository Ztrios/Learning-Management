import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/profile/data/models/student_profile_model.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';

sealed class ProfileRemoteDatasource {
  Future<Either<Failure,StudentProfileEntity>> getStudentProfile({required String studentId});
}

class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource{

  @override
  Future<Either<Failure, StudentProfileEntity>> getStudentProfile({required String studentId}) async {
    try{
      Response response = await sl<DioClient>().get(ApiUrls.studentProfile + studentId);
      StudentProfileEntity studentProfileEntity = StudentProfileModel.fromJson(response.data).toEntity();
      return Right(studentProfileEntity);
    }catch(error, stackTrace){
      log(
          "Profile Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

}