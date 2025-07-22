import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/home/domain/entities/subject_entity.dart';
import 'package:learning_management/features/home/domain/repositories/home_repositories.dart';

class GetStudentSubjectsUseCase extends UseCase<SubjectsEntity, String>{
  @override
  Future<Either<Failure, SubjectsEntity>> call({String? params}) async =>
      await sl<HomeRepositories>().getStudentSubjects(studentId: params ?? "");
}