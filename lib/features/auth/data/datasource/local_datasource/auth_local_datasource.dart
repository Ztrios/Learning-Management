import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';

sealed class AuthLocalDatasource {
  Future<Either<Failure,bool>> saveSignInEntity({required SignInEntity signInEntity});
  Future<Either<Failure, SignInEntity?>> getSignInEntity();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {

  @override
  Future<Either<Failure, bool>> saveSignInEntity(
      {required SignInEntity signInEntity}) async {
    try {
      Box box = Hive.box(LocalDatabaseKeys.database);
      box.put(LocalDatabaseKeys.student, signInEntity.toRawJson());
      return Right(true);
    } catch (error, stackTrace) {
      log(
          "Auth Local Datasource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, SignInEntity?>> getSignInEntity() async {
    try{
      Box box = Hive.box(LocalDatabaseKeys.database);
      String? data = box.get(LocalDatabaseKeys.student);
      if(data != null){
        SignInEntity signInEntity = SignInEntity.fromRawJson(data);
        return right(signInEntity);
      }
      return Right(null);
    }catch(error,stackTrace){
      log(
        "auth Local Datasource",
        error: error,
        stackTrace: stackTrace
      );
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }


}