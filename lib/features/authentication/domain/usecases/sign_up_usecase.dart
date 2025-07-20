import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/authentication/domain/entities/student_entity.dart';
import 'package:learning_management/features/authentication/domain/repositories/authentication_repositories.dart';

class SignupUseCase extends UseCase<StudentEntity, Map<String,dynamic>>{

  @override
  Future<Either<Failure, StudentEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<AuthenticationRepositories>().signUp(body: params ?? {});
  
}