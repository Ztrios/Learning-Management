import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/subject_details/domain/entities/quiz_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/repositories/subject_details_repositories.dart';

class GetQuizListUseCase extends UseCase<QuizListEntity, String>{
  @override
  Future<Either<Failure, QuizListEntity>> call({String? params}) async =>
      await sl<SubjectDetailsRepositories>().getQuizList(lessionId: params ?? "");
}