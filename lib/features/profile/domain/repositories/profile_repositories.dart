import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';

abstract class ProfileRepositories{
  Future<Either<Failure,StudentProfileEntity>> getStudentProfile({required String studentId});
  Future<Either<Failure,StudentProfileEntity>> updateStudentProfile({required String studentId, required Map<String,dynamic> body});
}