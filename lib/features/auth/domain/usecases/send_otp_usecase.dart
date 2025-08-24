import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/auth/domain/entities/otp_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';

class SendOTPUseCase extends UseCase<OtpEntity, Map<String,dynamic>>{
  @override
  Future<Either<Failure, OtpEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<AuthRepositories>().sendOTP(body: params ?? {});
}