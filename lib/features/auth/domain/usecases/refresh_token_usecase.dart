import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';

class RefreshTokenUseCase extends UseCase<SignInEntity, Map<String, dynamic>>{
  @override
  Future<Either<Failure, SignInEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<AuthRepositories>().refreshToken(body: params ?? {});
}