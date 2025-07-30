import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/lessons/data/datasource/remote_datasource/lessions_remote_datasouce.dart';
import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';
import 'package:learning_management/features/lessons/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';

class LessionsRepositoriesImpl implements LessionsRepositories{
  @override
  Future<Either<Failure, LessionsListEntity>> getLessionsList({required String subjectId}) async =>
      await sl<LessionsRemoteDataSource>().getLessionsList(subjectId: subjectId);

  @override
  Future<Either<Failure, ExamsListEntity>> getExamsList({required String subjectId}) async =>
      await sl<LessionsRemoteDataSource>().getExamsList(subjectId: subjectId);

}