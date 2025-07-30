import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/lessons/domain/entities/exam_details_entity.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';

class GetExamDetailsUseCase extends UseCase<ExamDetailsEntity, String>{
  @override
  Future<Either<Failure, ExamDetailsEntity>> call({String? params}) async =>
      await sl<LessionsRepositories>().getExamsDetails(examId: params ?? "");

}