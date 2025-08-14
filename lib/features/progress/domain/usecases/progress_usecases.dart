import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/progress/domain/entities/progress_entities.dart';
import 'package:learning_management/features/progress/domain/repositories/progress_repositories.dart';

class ProgressUseCase extends UseCase<ProgressEntity, String>{
  @override
  Future<Either<Failure, ProgressEntity>> call({String? params}) async =>
      await sl<ProgressRepositories>().getStudentProgress(studentId: params ?? "");
}