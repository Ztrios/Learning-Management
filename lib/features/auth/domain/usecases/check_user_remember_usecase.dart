import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';

class  CheckUserRememberUseCase extends UseCase<bool, dynamic>{
  @override
  Future<Either<Failure, bool>> call({params}) async =>
      sl<AuthRepositories>().userIsRemembered();
}