import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/payments/data/datasource/remote_datasource/payments_remote_datasource.dart';
import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';
import 'package:learning_management/features/payments/domain/entities/payment_entity.dart';
import 'package:learning_management/features/payments/domain/entities/payment_history_entity.dart';
import 'package:learning_management/features/payments/domain/repositories/payments_repositories.dart';

class PaymentsRepositoriesImpl implements PaymentsRepositories{
  @override
  Future<Either<Failure, InvoiceEntity>> getInvoice({required String studentId}) async =>
      await sl<PaymentsRemoteDatasource>().getInvoice(studentId: studentId);


  @override
  Future<Either<Failure, PaymentEntity>> createPayment({required Map<String, dynamic> body}) async =>
      await sl<PaymentsRemoteDatasource>().createPayment(body: body);

  @override
  Future<Either<Failure, PaymentHistoryEntity>> getPaymentHistory({required Map<String, dynamic> query}) async =>
      await sl<PaymentsRemoteDatasource>().getPaymentHistory(query: query);

}