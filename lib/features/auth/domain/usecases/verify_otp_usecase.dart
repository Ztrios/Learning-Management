import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/auth/domain/entities/otp_verification_entity.dart';
import 'package:learning_management/features/auth/domain/repositories/auth_repositories.dart';

class VerifyOtpUseCase extends UseCase<OtpVerificationEntity, Map<String,dynamic>>{

  @override
  Future<Either<Failure, OtpVerificationEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<AuthRepositories>().verifyOTP(body: params ?? {});

}