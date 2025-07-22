import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';

class SectionsUseCase extends UseCase<SectionsEntity, String>{

  @override
  Future<Either<Failure, SectionsEntity>> call({String? params}) async =>
      await sl<AuthRepositories>().getSections(batchYear: params ?? "2025");

}