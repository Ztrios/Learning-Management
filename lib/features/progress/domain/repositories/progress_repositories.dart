import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/progress/domain/entities/progress_entities.dart';

abstract class ProgressRepositories {
  Future<Either<Failure, ProgressEntity>> getStudentProgress({required String studentId});
}