import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/entities/student_entity.dart';

abstract class AuthRepositories {
  Future<Either<Failure,SignInEntity>> signIn({required Map<String,dynamic> body});
  Future<Either<Failure,StudentEntity>> signUp({required Map<String,dynamic> body});
  Future<Either<Failure,SectionsEntity>> getSections({required String batchYear});
  Future<Either<Failure,bool>> saveSignInEntity({required SignInEntity signInEntity});
  Future<Either<Failure,SignInEntity?>> getSignInEntity();
}