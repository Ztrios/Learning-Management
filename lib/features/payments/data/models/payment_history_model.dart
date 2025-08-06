import 'dart:convert';

import 'package:learning_management/features/payments/domain/entities/payment_history_entity.dart';

class PaymentHistoryModel {
  final int? statusCode;
  final String? message;
  final PaymentHistoryData? paymentHistoryData;

  PaymentHistoryModel({
    this.statusCode,
    this.message,
    this.paymentHistoryData,
  });

  PaymentHistoryModel copyWith({
    int? statusCode,
    String? message,
    PaymentHistoryData? paymentHistoryData,
  }) =>
      PaymentHistoryModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        paymentHistoryData: paymentHistoryData ?? this.paymentHistoryData,
      );

  factory PaymentHistoryModel.fromRawJson(String str) => PaymentHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) => PaymentHistoryModel(
    statusCode: json["statusCode"],
    message: json["message"],
    paymentHistoryData: json["data"] == null ? null : PaymentHistoryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": paymentHistoryData?.toJson(),
  };

  PaymentHistoryEntity toEntity()=> PaymentHistoryEntity(
    statusCode: statusCode,
    message: message,
    paymentHistoryData: paymentHistoryData,
  );

}

class PaymentHistoryData {
  final List<Content>? content;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;
  final bool? first;
  final bool? last;

  PaymentHistoryData({
    this.content,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  PaymentHistoryData copyWith({
    List<Content>? content,
    int? pageNumber,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
  }) =>
      PaymentHistoryData(
        content: content ?? this.content,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
        first: first ?? this.first,
        last: last ?? this.last,
      );

  factory PaymentHistoryData.fromRawJson(String str) => PaymentHistoryData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentHistoryData.fromJson(Map<String, dynamic> json) => PaymentHistoryData(
    content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "first": first,
    "last": last,
  };
}

class Content {
  final int? id;
  final Student? student;
  final int? noOfMonth;
  final List<String>? paymentMonth;
  final double? registrationFee;
  final double? monthlyFee;
  final double? totalAmount;
  final double? totalDiscount;
  final double? paidAmount;
  final double? dueAmount;
  final String? paymentStatus;
  final DateTime? paymentDate;
  final String? paymentMethod;
  final dynamic transactionId;
  final dynamic bankTransactionId;
  final String? currency;
  final double? registrationDiscountAmount;
  final double? monthlyFeeDiscountAmount;
  final String? invoiceId;
  final dynamic paymentId;

  Content({
    this.id,
    this.student,
    this.noOfMonth,
    this.paymentMonth,
    this.registrationFee,
    this.monthlyFee,
    this.totalAmount,
    this.totalDiscount,
    this.paidAmount,
    this.dueAmount,
    this.paymentStatus,
    this.paymentDate,
    this.paymentMethod,
    this.transactionId,
    this.bankTransactionId,
    this.currency,
    this.registrationDiscountAmount,
    this.monthlyFeeDiscountAmount,
    this.invoiceId,
    this.paymentId,
  });

  Content copyWith({
    int? id,
    Student? student,
    int? noOfMonth,
    List<String>? paymentMonth,
    double? registrationFee,
    double? monthlyFee,
    double? totalAmount,
    double? totalDiscount,
    double? paidAmount,
    double? dueAmount,
    String? paymentStatus,
    DateTime? paymentDate,
    String? paymentMethod,
    dynamic transactionId,
    dynamic bankTransactionId,
    String? currency,
    double? registrationDiscountAmount,
    double? monthlyFeeDiscountAmount,
    String? invoiceId,
    dynamic paymentId,
  }) =>
      Content(
        id: id ?? this.id,
        student: student ?? this.student,
        noOfMonth: noOfMonth ?? this.noOfMonth,
        paymentMonth: paymentMonth ?? this.paymentMonth,
        registrationFee: registrationFee ?? this.registrationFee,
        monthlyFee: monthlyFee ?? this.monthlyFee,
        totalAmount: totalAmount ?? this.totalAmount,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        paidAmount: paidAmount ?? this.paidAmount,
        dueAmount: dueAmount ?? this.dueAmount,
        paymentStatus: paymentStatus ?? this.paymentStatus,
        paymentDate: paymentDate ?? this.paymentDate,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        transactionId: transactionId ?? this.transactionId,
        bankTransactionId: bankTransactionId ?? this.bankTransactionId,
        currency: currency ?? this.currency,
        registrationDiscountAmount: registrationDiscountAmount ?? this.registrationDiscountAmount,
        monthlyFeeDiscountAmount: monthlyFeeDiscountAmount ?? this.monthlyFeeDiscountAmount,
        invoiceId: invoiceId ?? this.invoiceId,
        paymentId: paymentId ?? this.paymentId,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    noOfMonth: json["noOfMonth"],
    paymentMonth: json["paymentMonth"] == null ? [] : List<String>.from(json["paymentMonth"]!.map((x) => x)),
    registrationFee: json["registrationFee"],
    monthlyFee: json["monthlyFee"],
    totalAmount: json["totalAmount"],
    totalDiscount: json["totalDiscount"],
    paidAmount: json["paidAmount"],
    dueAmount: json["dueAmount"],
    paymentStatus: json["paymentStatus"],
    paymentDate: json["paymentDate"] == null ? null : DateTime.parse(json["paymentDate"]),
    paymentMethod: json["paymentMethod"],
    transactionId: json["transactionId"],
    bankTransactionId: json["bankTransactionId"],
    currency: json["currency"],
    registrationDiscountAmount: json["registrationDiscountAmount"],
    monthlyFeeDiscountAmount: json["monthlyFeeDiscountAmount"],
    invoiceId: json["invoiceId"],
    paymentId: json["paymentId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student": student?.toJson(),
    "noOfMonth": noOfMonth,
    "paymentMonth": paymentMonth == null ? [] : List<dynamic>.from(paymentMonth!.map((x) => x)),
    "registrationFee": registrationFee,
    "monthlyFee": monthlyFee,
    "totalAmount": totalAmount,
    "totalDiscount": totalDiscount,
    "paidAmount": paidAmount,
    "dueAmount": dueAmount,
    "paymentStatus": paymentStatus,
    "paymentDate": "${paymentDate!.year.toString().padLeft(4, '0')}-${paymentDate!.month.toString().padLeft(2, '0')}-${paymentDate!.day.toString().padLeft(2, '0')}",
    "paymentMethod": paymentMethod,
    "transactionId": transactionId,
    "bankTransactionId": bankTransactionId,
    "currency": currency,
    "registrationDiscountAmount": registrationDiscountAmount,
    "monthlyFeeDiscountAmount": monthlyFeeDiscountAmount,
    "invoiceId": invoiceId,
    "paymentId": paymentId,
  };
}

class Student {
  final int? id;
  final String? fullName;
  final String? email;
  final bool? isRegistrationDone;
  final String? rollNumber;
  final String? phone;

  Student({
    this.id,
    this.fullName,
    this.email,
    this.isRegistrationDone,
    this.rollNumber,
    this.phone,
  });

  Student copyWith({
    int? id,
    String? fullName,
    String? email,
    bool? isRegistrationDone,
    String? rollNumber,
    String? phone,
  }) =>
      Student(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        isRegistrationDone: isRegistrationDone ?? this.isRegistrationDone,
        rollNumber: rollNumber ?? this.rollNumber,
        phone: phone ?? this.phone,
      );

  factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    fullName: json["fullName"],
    email: json["email"],
    isRegistrationDone: json["isRegistrationDone"],
    rollNumber: json["rollNumber"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "email": email,
    "isRegistrationDone": isRegistrationDone,
    "rollNumber": rollNumber,
    "phone": phone,
  };
}
