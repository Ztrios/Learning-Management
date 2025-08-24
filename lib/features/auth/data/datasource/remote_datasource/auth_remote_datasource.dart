import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/auth/data/models/otp_model.dart';
import 'package:learning_management/features/auth/data/models/otp_verification_model.dart';
import 'package:learning_management/features/auth/data/models/sections_model.dart';
import 'package:learning_management/features/auth/data/models/sign_in_model.dart';
import 'package:learning_management/features/auth/data/models/standards_model.dart';
import 'package:learning_management/features/auth/data/models/student_model.dart';
import 'package:learning_management/features/auth/domain/entities/otp_entity.dart';
import 'package:learning_management/features/auth/domain/entities/otp_verification_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/standards_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';

sealed class AuthRemoteDatasource {
  Future<Either<Failure, SignInEntity>> signIn({required Map<String,dynamic> body});
  Future<Either<Failure, StudentEntity>> signUp({required Map<String,dynamic> body});
  Future<Either<Failure, OtpEntity>> sendOTP({required Map<String, dynamic> body});
  Future<Either<Failure, OtpVerificationEntity>> verifyOTP({required Map<String, dynamic> body});
  Future<Either<Failure, bool>> resetPassword({required Map<String,dynamic> body});
  Future<Either<Failure, SignInEntity>> refreshToken({required Map<String,dynamic> body});
  Future<Either<Failure, SectionsEntity>> getSections({required Map<String,dynamic> query});
  Future<Either<Failure, StandardsEntity>> getStandards();
}


class AuthRemoteDatasourceImpl implements AuthRemoteDatasource{


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
        "Auth Remote DataSource: ",
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
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, OtpEntity>> sendOTP({required Map<String, dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
          ApiUrls.sendOTP,
          data: body
      );
      OtpEntity otpEntity = OtpModel.fromJson(response.data).toEntity();
      return Right(otpEntity);
    } catch (error, stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, OtpVerificationEntity>> verifyOTP({required Map<String, dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
          ApiUrls.verifyOTP,
          data: body
      );
      OtpVerificationEntity otpVerificationEntity = OtpVerificationModel.fromJson(response.data).toEntity();
      return Right(otpVerificationEntity);
    } catch (error, stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }



  @override
  Future<Either<Failure, bool>> resetPassword({required Map<String, dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
          ApiUrls.resetPassword,
          data: body
      );
      return Right(response.statusCode == 200);
    }catch(error, stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, SignInEntity>> refreshToken({required Map<String,dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
          ApiUrls.refreshToken,
          data: body
      );
      SignInEntity signInEntity = SignInModel.fromJson(response.data).toEntity();
      return Right(signInEntity);
    }catch(error, stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, SectionsEntity>> getSections({required Map<String,dynamic> query}) async {
    try{
      Response response = await sl<DioClient>().get(
        ApiUrls.sections,
        queryParameters: query
      );
      SectionsEntity sectionEntity = SectionsModel.fromJson(response.data).toEntity();
      return Right(sectionEntity);
    }catch(error,stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, StandardsEntity>> getStandards() async {
    try{
      Response response = await sl<DioClient>().get(ApiUrls.standards);
      StandardsEntity standardsEntity = StandardsModel.fromJson(response.data).toEntity();
      return Right(standardsEntity);
    }catch(error,stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

}