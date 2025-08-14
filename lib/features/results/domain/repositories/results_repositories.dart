import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/results/domain/entities/results_entities.dart';

abstract class ResultsRepositories{
  Future<Either<Failure, ResultsEntity>> getStudentResults({required String studentId});
}