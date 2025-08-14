import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/results/data/datasource/remote_datasource/results_remote_datasource.dart';
import 'package:learning_management/features/results/domain/entities/results_entities.dart';
import 'package:learning_management/features/results/domain/repositories/results_repositories.dart';

class ResultsRepositoriesImpl implements ResultsRepositories{
  @override
  Future<Either<Failure, ResultsEntity>> getStudentResults({required String studentId}) async =>
      await sl<ResultsRemoteDatasource>().getStudentResults(studentId: studentId);
}