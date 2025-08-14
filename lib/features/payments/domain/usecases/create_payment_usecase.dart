import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/payments/domain/entities/payment_entity.dart';
import 'package:learning_management/features/payments/domain/repositories/payments_repositories.dart';

class CreatePaymentUseCase extends UseCase<PaymentEntity, Map<String,dynamic>>{
  @override
  Future<Either<Failure, PaymentEntity>> call({Map<String, dynamic>? params}) async =>
      await sl<PaymentsRepositories>().createPayment(body: params ?? {});

}