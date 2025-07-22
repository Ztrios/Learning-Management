import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/home/domain/entities/subject_entity.dart';

abstract class HomeRepositories {
  Future<Either<Failure, SubjectsEntity>> getStudentSubjects({required String studentId});
}