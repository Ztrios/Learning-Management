import 'package:learning_management/features/payments/data/models/payment_model.dart';

class PaymentEntity {
  final int? statusCode;
  final String? message;
  final PaymentData? paymentData;

  PaymentEntity({
    this.statusCode,
    this.message,
    this.paymentData,
  });

}