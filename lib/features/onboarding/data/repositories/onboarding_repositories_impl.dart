import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/onboarding/data/datasource/local_datasource/onboarding_local_datasource.dart';
import 'package:learning_management/features/onboarding/domain/repositories/onboarding_repositories.dart';

class OnboardingRepositoryImpl implements OnboardingRepositories{

  @override
  Future<Either<Failure, bool>> userIsOnboarded() async =>
      await sl<OnboardingLocalDatasource>().userIsOnboarded();

  @override
  Future<Either<Failure, bool>> alreadyOnboarded() async =>
      await sl<OnboardingLocalDatasource>().alreadyOnboarded();

}