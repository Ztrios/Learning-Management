import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';

abstract class PaymentsRepositories{
  Future<Either<Failure,InvoiceEntity>> getInvoice({required String studentId});
}