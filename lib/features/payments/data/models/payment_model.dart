import 'dart:convert';

import 'package:learning_management/features/payments/domain/entities/payment_entity.dart';

class PaymentModel {
  final int? statusCode;
  final String? message;
  final PaymentData? paymentData;

  PaymentModel({
    this.statusCode,
    this.message,
    this.paymentData,
  });

  PaymentModel copyWith({
    int? statusCode,
    String? message,
    PaymentData? paymentData,
  }) =>
      PaymentModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        paymentData: paymentData ?? this.paymentData,
      );

  factory PaymentModel.fromRawJson(String str) => PaymentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    statusCode: json["statusCode"],
    message: json["message"],
    paymentData: json["data"] == null ? null : PaymentData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": paymentData?.toJson(),
  };


  PaymentEntity toEntity() => PaymentEntity(
    statusCode: statusCode,
    message: message,
    paymentData: paymentData,
  );


}

class PaymentData {
  final String? paymentUrl;
  final String? status;
  final String? invoiceId;
  final String? gateway;
  final String? paymentId;

  PaymentData({
    this.paymentUrl,
    this.status,
    this.invoiceId,
    this.gateway,
    this.paymentId,
  });

  PaymentData copyWith({
    String? paymentUrl,
    String? status,
    String? invoiceId,
    String? gateway,
    String? paymentId,
  }) =>
      PaymentData(
        paymentUrl: paymentUrl ?? this.paymentUrl,
        status: status ?? this.status,
        invoiceId: invoiceId ?? this.invoiceId,
        gateway: gateway ?? this.gateway,
        paymentId: paymentId ?? this.paymentId,
      );

  factory PaymentData.fromRawJson(String str) => PaymentData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
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
}
