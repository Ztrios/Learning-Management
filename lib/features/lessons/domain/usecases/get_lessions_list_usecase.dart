import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';

class GetLessionsUseCase extends UseCase<LessionsListEntity, String>{
  @override
  Future<Either<Failure, LessionsListEntity>> call({String? params}) async =>
      await sl<LessionsRepositories>().getLessionsList(subjectId: params ?? "");
}