import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/authentication/domain/entities/sections_entity.dart';
import 'package:learning_management/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/authentication/domain/entities/student_entity.dart';

abstract class AuthenticationRepositories {
  Future<Either<Failure,SignInEntity>> signIn({required Map<String,dynamic> body});
  Future<Either<Failure,StudentEntity>> signUp({required Map<String,dynamic> body});
  Future<Either<Failure,SectionsEntity>> getSections({required String batchYear});
}