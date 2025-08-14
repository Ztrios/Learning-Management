import 'dart:convert';

import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';

class InvoiceModel {
  final int? statusCode;
  final String? message;
  final Invoice? invoice;

  InvoiceModel({
    this.statusCode,
    this.message,
    this.invoice,
  });

  InvoiceModel copyWith({
    int? statusCode,
    String? message,
    Invoice? invoice,
  }) =>
      InvoiceModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        invoice: invoice ?? this.invoice,
      );

  factory InvoiceModel.fromRawJson(String str) => InvoiceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    statusCode: json["statusCode"],
    message: json["message"],
    invoice: json["data"] == null ? null : Invoice.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": invoice?.toJson(),
  };


  InvoiceEntity toEntity() => InvoiceEntity(
    statusCode: statusCode,
    message: message,
    invoice: invoice,
  );

}

class Invoice {
  final bool? isRegistrationDone;
  final String? toPayableMonth;
  final num? registrationFee;
  final num? regDiscount;
  final String? regDiscountType;
  final num? registrationAmountExcludeDiscount;
  final num? monthlyFee;
  final num? monthlyDiscount;
  final String? monthlyDiscountType;
  final num? monthlyAmountExcludeDiscount;
  final num? totalAmount;

  Invoice({
    this.isRegistrationDone,
    this.toPayableMonth,
    this.registrationFee,
    this.regDiscount,
    this.regDiscountType,
    this.registrationAmountExcludeDiscount,
    this.monthlyFee,
    this.monthlyDiscount,
    this.monthlyDiscountType,
    this.monthlyAmountExcludeDiscount,
    this.totalAmount,
  });

  Invoice copyWith({
    bool? isRegistrationDone,
    String? toPayableMonth,
    num? registrationFee,
    num? regDiscount,
    String? regDiscountType,
    num? registrationAmountExcludeDiscount,
    num? monthlyFee,
    num? monthlyDiscount,
    String? monthlyDiscountType,
    num? monthlyAmountExcludeDiscount,
    num? totalAmount,
  }) =>
      Invoice(
        isRegistrationDone: isRegistrationDone ?? this.isRegistrationDone,
        toPayableMonth: toPayableMonth ?? this.toPayableMonth,
        registrationFee: registrationFee ?? this.registrationFee,
        regDiscount: regDiscount ?? this.regDiscount,
        regDiscountType: regDiscountType ?? this.regDiscountType,
        registrationAmountExcludeDiscount: registrationAmountExcludeDiscount ?? this.registrationAmountExcludeDiscount,
        monthlyFee: monthlyFee ?? this.monthlyFee,
        monthlyDiscount: monthlyDiscount ?? this.monthlyDiscount,
        monthlyDiscountType: monthlyDiscountType ?? this.monthlyDiscountType,
        monthlyAmountExcludeDiscount: monthlyAmountExcludeDiscount ?? this.monthlyAmountExcludeDiscount,
        totalAmount: totalAmount ?? this.totalAmount,
      );

  factory Invoice.fromRawJson(String str) => Invoice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    isRegistrationDone: json["isRegistrationDone"],
    toPayableMonth: json["toPayableMonth"],
    registrationFee: json["registrationFee"],
    regDiscount: json["regDiscount"],
    regDiscountType: json["regDiscountType"],
    registrationAmountExcludeDiscount: json["registrationAmountExcludeDiscount"],
    monthlyFee: json["monthlyFee"],
    monthlyDiscount: json["monthlyDiscount"],
    monthlyDiscountType: json["monthlyDiscountType"],
    monthlyAmountExcludeDiscount: json["monthlyAmountExcludeDiscount"],
    totalAmount: json["totalAmount"],
  );

  Map<String, dynamic> toJson() => {
    "isRegistrationDone": isRegistrationDone,
    "toPayableMonth": toPayableMonth,
    "registrationFee": registrationFee,
    "regDiscount": regDiscount,
    "regDiscountType": regDiscountType,
    "registrationAmountExcludeDiscount": registrationAmountExcludeDiscount,
    "monthlyFee": monthlyFee,
    "monthlyDiscount": monthlyDiscount,
    "monthlyDiscountType": monthlyDiscountType,
    "monthlyAmountExcludeDiscount": monthlyAmountExcludeDiscount,
    "totalAmount": totalAmount,
  };
}
