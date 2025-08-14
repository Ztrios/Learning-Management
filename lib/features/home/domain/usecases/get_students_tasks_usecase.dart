import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/home/domain/entities/tasks_entity.dart';
import 'package:learning_management/features/home/domain/repositories/home_repositories.dart';

class GetStudentTasksUseCase extends UseCase<TasksEntity,String>{
  @override
  Future<Either<Failure, TasksEntity>> call({String? params}) async =>
      await sl<HomeRepositories>().getStudentTasks(sectionId: params ?? "5");
}