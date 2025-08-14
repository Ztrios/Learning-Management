import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({Params params});
}