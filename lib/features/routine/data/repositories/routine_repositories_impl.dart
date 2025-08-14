import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/routine/data/datasource/remote_datasource/routine_remote_datasource.dart';
import 'package:learning_management/features/routine/domain/entities/class_routine_entities.dart';
import 'package:learning_management/features/routine/domain/repositories/routine_repositories.dart';

class RoutineRepositoriesImpl implements RoutineRepositories{
  @override
  Future<Either<Failure, ClassRoutineEntity>> getClassRoutines({required String sectionId, required DateTime dateTime}) async =>
      await sl<RoutineRemoteDatasource>().getClassRoutines(sectionId: sectionId, dateTime: dateTime);
}