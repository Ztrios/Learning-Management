import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/authentication/data/models/sign_in_model.dart';
import 'package:learning_management/features/authentication/data/models/student_model.dart';
import 'package:learning_management/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/authentication/domain/entities/student_entity.dart';

sealed class AuthenticationRemoteDatasource {
  Future<Either<Failure, SignInEntity>> signIn({required Map<String,dynamic> body});
  Future<Either<Failure, StudentEntity>> signUp({required Map<String,dynamic> body});
}


class AuthenticationRemoteDatasourceImpl implements AuthenticationRemoteDatasource{


  @override
  Future<Either<Failure, SignInEntity>> signIn({required Map<String,dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
          ApiUrls.signIn,
        data: body
      );
      SignInEntity signInEntity = SignInModel.fromJson(response.data).toEntity();
      return Right(signInEntity);
    }catch(error, stackTrace){
      log(
        "Authentication DataSource: ",
        error: error,
        stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, StudentEntity>> signUp({required Map<String,dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
        ApiUrls.signUp,
        options: Options(contentType: "multipart/form-data"),
        data: FormData.fromMap(body)
      );
      StudentEntity studentEntity = StudentModel.fromJson(response.data).toEntity();
      return right(studentEntity);
    }catch(error, stackTrace){
      log(
          "Authentication DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }





}