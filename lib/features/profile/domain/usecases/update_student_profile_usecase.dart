import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';
import 'package:learning_management/features/profile/domain/repositories/profile_repositories.dart';

class UpdateStudentProfileParams{
  final String studentId;
  final Map<String,dynamic> body;
  const UpdateStudentProfileParams({required this.studentId, required this.body});

}
class UpdateStudentProfileUseCase extends UseCase<StudentProfileEntity, UpdateStudentProfileParams>{
  @override
  Future<Either<Failure, StudentProfileEntity>> call({UpdateStudentProfileParams? params}) async =>
      await sl<ProfileRepositories>().updateStudentProfile(studentId: params?.studentId ?? "", body: params?.body ?? {});

}