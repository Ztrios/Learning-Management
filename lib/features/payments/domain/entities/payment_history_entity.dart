import 'package:learning_management/features/payments/data/models/payment_history_model.dart';

class PaymentHistoryEntity {
  final int? statusCode;
  final String? message;
  final PaymentHistoryData? paymentHistoryData;

  PaymentHistoryEntity({
    this.statusCode,
    this.message,
    this.paymentHistoryData,
  });
}