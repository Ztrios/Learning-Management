import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/subject_details/domain/entities/questions_list_entity.dart';
import 'package:learning_management/features/subject_details/domain/repositories/subject_details_repositories.dart';

class GetQuestionsListUseCase extends UseCase<QuestionsListEntity, String>{
  @override
  Future<Either<Failure, QuestionsListEntity>> call({String? params}) async =>
      await sl<SubjectDetailsRepositories>().getQuestionsList(quizId: params ?? "");
}