import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/profile/data/datasource/remote_datasource/profile_remote_datasource.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';
import 'package:learning_management/features/profile/domain/repositories/profile_repositories.dart';

class ProfileRepositoriesImpl implements ProfileRepositories{

  @override
  Future<Either<Failure, StudentProfileEntity>> getStudentProfile({required String studentId}) async =>
      await sl<ProfileRemoteDatasource>().getStudentProfile(studentId: studentId);

  @override
  Future<Either<Failure, StudentProfileEntity>> updateStudentProfile({required String studentId, required Map<String, dynamic> body}) async =>
      await sl<ProfileRemoteDatasource>().updateStudentProfile(studentId: studentId, body: body);
}