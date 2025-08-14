import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/home/domain/entities/todays_class_entity.dart';
import 'package:learning_management/features/home/domain/repositories/home_repositories.dart';

class GetTodayClassUseCase extends UseCase<TodaysClassEntity, String>{
  @override
  Future<Either<Failure, TodaysClassEntity>> call({String? params}) async =>
      await sl<HomeRepositories>().getTodaysClass(sectionId: params ?? "3");
}