import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';
import 'package:learning_management/features/payments/domain/entities/payment_entity.dart';
import 'package:learning_management/features/payments/domain/entities/payment_history_entity.dart';

abstract class PaymentsRepositories{
  Future<Either<Failure,InvoiceEntity>> getInvoice({required String studentId});
  Future<Either<Failure,PaymentEntity>> createPayment({required Map<String,dynamic> body});
  Future<Either<Failure,PaymentHistoryEntity>> getPaymentHistory({required Map<String,dynamic> query});
}