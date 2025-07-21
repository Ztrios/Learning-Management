import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/authentication/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/authentication/domain/repositories/authentication_repositories.dart';

class SaveSignInEntityUseCase extends UseCase<bool, SignInEntity>{
  @override
  Future<Either<Failure, bool>> call({SignInEntity? params}) async =>
      await sl<AuthenticationRepositories>().saveSignInEntity(signInEntity: params!);
}