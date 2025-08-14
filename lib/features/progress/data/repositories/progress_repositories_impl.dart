import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/progress/data/datasource/remote_datasource/progress_remote_datasource.dart';
import 'package:learning_management/features/progress/domain/entities/progress_entities.dart';
import 'package:learning_management/features/progress/domain/repositories/progress_repositories.dart';

class ProgressRepositoriesImpl implements ProgressRepositories{
  @override
  Future<Either<Failure, ProgressEntity>> getStudentProgress({required String studentId}) async =>
      await sl<ProgressRemoteDataSource>().getStudentProgress(studentId: studentId);

}