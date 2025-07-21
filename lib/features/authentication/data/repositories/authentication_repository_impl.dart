import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/authentication/data/datasource/remote_datasource/authentication_remote_datasource.dart';
import 'package:learning_management/features/authentication/domain/entities/sections_entity.dart';
import 'package:learning_management/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/authentication/domain/entities/student_entity.dart';
import 'package:learning_management/features/authentication/domain/repositories/authentication_repositories.dart';

class AuthenticationRepositoryIml implements AuthenticationRepositories{

  @override
  Future<Either<Failure, SignInEntity>> signIn({required Map<String,dynamic> body}) async =>
      await sl<AuthenticationRemoteDatasource>().signIn(body: body);

  @override
  Future<Either<Failure, StudentEntity>> signUp({required Map<String,dynamic> body}) async =>
      await sl<AuthenticationRemoteDatasource>().signUp(body: body);

  @override
  Future<Either<Failure, SectionsEntity>> getSections({required String batchYear}) async =>
      await sl<AuthenticationRemoteDatasource>().getSections(batchYear: batchYear);

}