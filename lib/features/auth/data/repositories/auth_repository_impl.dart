import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:learning_management/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:learning_management/features/auth/domain/entities/otp_entity.dart';
import 'package:learning_management/features/auth/domain/entities/otp_verification_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/standards_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';
import 'package:learning_management/features/auth/presentation/pages/reset_password_page.dart';

class AuthRepositoryIml implements AuthRepositories{

  @override
  Future<Either<Failure, SignInEntity>> signIn({required Map<String,dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().signIn(body: body);

  @override
  Future<Either<Failure, StudentEntity>> signUp({required Map<String,dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().signUp(body: body);

  @override
  Future<Either<Failure, bool>> resetPassword({required Map<String, dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().resetPassword(body: body);

  @override
  Future<Either<Failure, OtpEntity>> sendOTP({required Map<String, dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().sendOTP(body: body);

  @override
  Future<Either<Failure, OtpVerificationEntity>> verifyOTP({required Map<String, dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().verifyOTP(body: body);

  @override
  Future<Either<Failure, SignInEntity>> refreshToken({required Map<String, dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().refreshToken(body: body);

  @override
  Future<Either<Failure, SectionsEntity>> getSections({required Map<String,dynamic> query}) async =>
      await sl<AuthRemoteDatasource>().getSections(query: query);

  @override
  Future<Either<Failure, StandardsEntity>> getStandards() async =>
      await sl<AuthRemoteDatasource>().getStandards();

  @override
  Future<Either<Failure, bool>> diactivateAccount({required String studentId}) async =>
    await sl<AuthRemoteDatasource>().diactivateAccount(studentId: studentId);

  @override
  Future<Either<Failure, bool>> saveSignInEntity({required SignInEntity signInEntity}) async =>
      await sl<AuthLocalDatasource>().saveSignInEntity(signInEntity: signInEntity);

  @override
  Future<Either<Failure, SignInEntity?>> getSignInEntity() async =>
      await sl<AuthLocalDatasource>().getSignInEntity();

  @override
  Future<Either<Failure, bool>> rememberUser() async =>
      await sl<AuthLocalDatasource>().rememberUser();

  @override
  Future<Either<Failure, bool>> userIsRemembered() async =>
      await sl<AuthLocalDatasource>().isUserRemembered();

  @override
  Future<Either<Failure, bool>> signOut() async =>
      await sl<AuthLocalDatasource>().clearLocalSource();

}