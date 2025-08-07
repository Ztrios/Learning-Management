import 'dart:convert';

import 'package:learning_management/features/payments/domain/entities/payment_entity.dart';

class PaymentModel {
  final String? paymentUrl;
  final String? status;
  final String? invoiceId;
  final String? gateway;
  final String? paymentId;

  PaymentModel({
    this.paymentUrl,
    this.status,
    this.invoiceId,
    this.gateway,
    this.paymentId,
  });

  PaymentModel copyWith({
    String? paymentUrl,
    String? status,
    String? invoiceId,
    String? gateway,
    String? paymentId,
  }) =>
      PaymentModel(
        paymentUrl: paymentUrl ?? this.paymentUrl,
        status: status ?? this.status,
        invoiceId: invoiceId ?? this.invoiceId,
        gateway: gateway ?? this.gateway,
        paymentId: paymentId ?? this.paymentId,
      );

  factory PaymentModel.fromRawJson(String str) => PaymentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    paymentUrl: json["paymentUrl"],
    status: json["status"],
    invoiceId: json["invoiceId"],
    gateway: json["gateway"],
    paymentId: json["paymentID"],
  );

  Map<String, dynamic> toJson() => {
    "paymentUrl": paymentUrl,
    "status": status,
    "invoiceId": invoiceId,
    "gateway": gateway,
    "paymentID": paymentId,
  };

  PaymentEntity toEntity ()=> PaymentEntity(
    paymentUrl: paymentUrl,
    status: status,
    invoiceId: invoiceId,
    gateway: gateway,
    paymentId: paymentId,
  );

}
