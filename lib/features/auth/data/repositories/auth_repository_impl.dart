import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/auth/data/datasource/local_datasource/auth_local_datasource.dart';
import 'package:learning_management/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoryIml implements AuthRepositories{

  @override
  Future<Either<Failure, SignInEntity>> signIn({required Map<String,dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().signIn(body: body);

  @override
  Future<Either<Failure, StudentEntity>> signUp({required Map<String,dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().signUp(body: body);

  @override
  Future<Either<Failure, SectionsEntity>> getSections({required String batchYear}) async =>
      await sl<AuthRemoteDatasource>().getSections(batchYear: batchYear);


  @override
  Future<Either<Failure, bool>> saveSignInEntity({required SignInEntity signInEntity}) async =>
      await sl<AuthLocalDatasource>().saveSignInEntity(signInEntity: signInEntity);

  @override
  Future<Either<Failure, SignInEntity>> getSignInEntity() async =>
      await sl<AuthLocalDatasource>().getSignInEntity();


}