import 'dart:convert';

import 'package:learning_management/features/auth/domain/entities/otp_entity.dart';

class OtpModel {
  final int? statusCode;
  final String? message;
  final OtpData? otpData;

  OtpModel({
    this.statusCode,
    this.message,
    this.otpData,
  });

  OtpModel copyWith({
    int? statusCode,
    String? message,
    OtpData? otpData,
  }) =>
      OtpModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        otpData: otpData ?? this.otpData,
      );

  factory OtpModel.fromRawJson(String str) => OtpModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
    statusCode: json["statusCode"],
    message: json["message"],
    otpData: json["data"] == null ? null : OtpData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": otpData?.toJson(),
  };

  OtpEntity toEntity()=> OtpEntity(
    statusCode: statusCode,
    message: message,
    otpData: otpData,
  );

}

class OtpData {
  final String? tempOtp;
  final DateTime? otpExpiryTime;
  final DateTime? otpResendTime;

  OtpData({
    this.tempOtp,
    this.otpExpiryTime,
    this.otpResendTime,
  });

  OtpData copyWith({
    String? tempOtp,
    DateTime? otpExpiryTime,
    DateTime? otpResendTime,
  }) =>
      OtpData(
        tempOtp: tempOtp ?? this.tempOtp,
        otpExpiryTime: otpExpiryTime ?? this.otpExpiryTime,
        otpResendTime: otpResendTime ?? this.otpResendTime,
      );

  factory OtpData.fromRawJson(String str) => OtpData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpData.fromJson(Map<String, dynamic> json) => OtpData(
    tempOtp: json["tempOtp"],
    otpExpiryTime: json["otpExpiryTime"] == null ? null : DateTime.parse(json["otpExpiryTime"]),
    otpResendTime: json["otpResendTime"] == null ? null : DateTime.parse(json["otpResendTime"]),
  );

  Map<String, dynamic> toJson() => {
    "tempOtp": tempOtp,
    "otpExpiryTime": otpExpiryTime?.toIso8601String(),
    "otpResendTime": otpResendTime?.toIso8601String(),
  };
}
