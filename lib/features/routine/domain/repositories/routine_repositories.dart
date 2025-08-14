import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/routine/domain/entities/class_routine_entities.dart';

abstract class RoutineRepositories {
  Future<Either<Failure,ClassRoutineEntity>> getClassRoutines({required String sectionId, required DateTime dateTime});
}