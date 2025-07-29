import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';
import 'package:learning_management/features/profile/domain/repositories/profile_repositories.dart';

class GetStudentProfileUseCase extends UseCase<StudentProfileEntity, String>{
  @override
  Future<Either<Failure, StudentProfileEntity>> call({String? params}) async =>
      await sl<ProfileRepositories>().getStudentProfile(studentId: params ?? "");
}