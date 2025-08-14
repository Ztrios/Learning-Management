import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:learning_management/core/error/failure.dart';

sealed class OnboardingLocalDatasource {
  Future<Either<Failure, bool>> userIsOnboarded();
  Future<Either<Failure, bool>> alreadyOnboarded();
}

class OnboardingLocalDatasourceImpl extends OnboardingLocalDatasource{


  @override
  Future<Either<Failure, bool>> userIsOnboarded() async {
    try{
      Box box = Hive.box(LocalDatabaseKeys.database);
      box.put(LocalDatabaseKeys.onboard, true);
      log("User viewed onboard.");
      return Right(true);
    }catch(error,stackTrace){
      log(
          "Onboard Local Datasource",
          error: error,
          stackTrace: stackTrace
      );
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }


  @override
  Future<Either<Failure, bool>> alreadyOnboarded() async {
    try{
      Box box = Hive.box(LocalDatabaseKeys.database);
      bool? alreadyOnboarded = box.get(LocalDatabaseKeys.onboard);
      log("Onboarded User");
      return Right(alreadyOnboarded ?? false);
    }catch(error,stackTrace){
      log(
          "Onboard Local Datasource",
          error: error,
          stackTrace: stackTrace
      );
      return Left(LocalDatabaseFailure(error.toString()));
    }
  }


}