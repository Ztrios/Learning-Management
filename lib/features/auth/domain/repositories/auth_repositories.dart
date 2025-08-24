import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/auth/domain/entities/otp_entity.dart';
import 'package:learning_management/features/auth/domain/entities/otp_verification_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/standards_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';

abstract class AuthRepositories {

  Future<Either<Failure,SignInEntity>> signIn({required Map<String,dynamic> body});
  Future<Either<Failure,StudentEntity>> signUp({required Map<String,dynamic> body});
  Future<Either<Failure, OtpEntity>> sendOTP({required Map<String, dynamic> body});
  Future<Either<Failure, OtpVerificationEntity>> verifyOTP({required Map<String, dynamic> body});
  Future<Either<Failure,bool>> resetPassword({required Map<String,dynamic> body});
  Future<Either<Failure,SignInEntity>> refreshToken({required Map<String,dynamic> body});

  Future<Either<Failure,SectionsEntity>> getSections({required Map<String,dynamic> query});
  Future<Either<Failure, StandardsEntity>> getStandards();

  Future<Either<Failure,bool>> saveSignInEntity({required SignInEntity signInEntity});
  Future<Either<Failure,SignInEntity?>> getSignInEntity();
  Future<Either<Failure, bool>> rememberUser();
  Future<Either<Failure, bool>> userIsRemembered();
  Future<Either<Failure, bool>> signOut();

}