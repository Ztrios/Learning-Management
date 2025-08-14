import 'package:learning_management/features/payments/data/models/invoice_model.dart';

class InvoiceEntity {
  final int? statusCode;
  final String? message;
  final Invoice? invoice;

  InvoiceEntity({
    this.statusCode,
    this.message,
    this.invoice,
  });
}