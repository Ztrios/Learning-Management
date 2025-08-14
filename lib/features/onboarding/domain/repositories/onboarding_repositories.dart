import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';

abstract class OnboardingRepositories{
  Future<Either<Failure, bool>> userIsOnboarded();
  Future<Either<Failure, bool>> alreadyOnboarded();
}