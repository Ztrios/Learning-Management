import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/routine/domain/entities/class_routine_entities.dart';
import 'package:learning_management/features/routine/domain/repositories/routine_repositories.dart';

class GetClassRoutineParams{
  final String sectionId;
  final DateTime dateTime;
  const GetClassRoutineParams({
    required this. sectionId,
    required this. dateTime
  }): assert(sectionId != "", "sectionId cannot be empty")
  ;
}

class GetClassRoutinesUseCase  extends UseCase<ClassRoutineEntity,GetClassRoutineParams>{
  @override
  Future<Either<Failure, ClassRoutineEntity>> call({GetClassRoutineParams? params}) async =>
      await sl<RoutineRepositories>().getClassRoutines(
          sectionId: params?.sectionId ?? "",
          dateTime: params?.dateTime ?? DateTime.now()
      );
}