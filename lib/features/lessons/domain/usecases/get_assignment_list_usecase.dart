import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/lessons/domain/entities/assignment_list_entity.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';

class GetAssignmentListUseCase extends UseCase<AssignmentListEntity, String> {
  @override
  Future<Either<Failure, AssignmentListEntity>> call({String? params}) async =>
     await sl<LessionsRepositories>().getAssignmentList(lessionId: params ?? "");

}