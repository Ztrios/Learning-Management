import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/lessons/domain/entities/lession_details_entity.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';

class GetLessionDetailsUseCase extends UseCase<LessionDetailsEntity, String>{
  @override
  Future<Either<Failure, LessionDetailsEntity>> call({String? params}) async =>
      await sl<LessionsRepositories>().getLessionDetails(lessionId: params ?? "");
}