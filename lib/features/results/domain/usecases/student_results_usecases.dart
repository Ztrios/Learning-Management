import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/results/domain/entities/results_entities.dart';
import 'package:learning_management/features/results/domain/repositories/results_repositories.dart';

class StudentResultsUseCase extends UseCase<ResultsEntity, String>{
  @override
  Future<Either<Failure, ResultsEntity>> call({String? params}) async =>
      await sl<ResultsRepositories>().getStudentResults(studentId: params ?? "143");
}