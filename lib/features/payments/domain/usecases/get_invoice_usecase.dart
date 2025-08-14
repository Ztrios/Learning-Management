import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';
import 'package:learning_management/features/payments/domain/repositories/payments_repositories.dart';

class GetInvoiceUseCase extends UseCase<InvoiceEntity, String>{
  @override
  Future<Either<Failure, InvoiceEntity>> call({String? params}) async =>
      await sl<PaymentsRepositories>().getInvoice(studentId: params ?? "");
}