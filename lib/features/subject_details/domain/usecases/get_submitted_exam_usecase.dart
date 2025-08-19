import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/subject_details/domain/entities/submitted_exam_entity.dart';
import 'package:learning_management/features/subject_details/domain/repositories/subject_details_repositories.dart';

class GetSubmittedExamUseCase extends UseCase<SubmittedExamEntity, String>{
  @override
  Future<Either<Failure, SubmittedExamEntity>> call({String? params}) async =>
      await sl<SubjectDetailsRepositories>().getSubmittedExamData(submissionId: params ?? "");
}