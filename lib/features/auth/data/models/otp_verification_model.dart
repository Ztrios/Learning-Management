import 'dart:convert';

import 'package:learning_management/features/auth/domain/entities/otp_verification_entity.dart';

class OtpVerificationModel {
  final int? statusCode;
  final String? message;
  final OtpVerificationData? otpVerificationData;

  OtpVerificationModel({
    this.statusCode,
    this.message,
    this.otpVerificationData,
  });

  OtpVerificationModel copyWith({
    int? statusCode,
    String? message,
    OtpVerificationData? otpVerificationData,
  }) =>
      OtpVerificationModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        otpVerificationData: otpVerificationData ?? this.otpVerificationData,
      );

  factory OtpVerificationModel.fromRawJson(String str) => OtpVerificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) => OtpVerificationModel(
    statusCode: json["statusCode"],
    message: json["message"],
    otpVerificationData: json["data"] == null ? null : OtpVerificationData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": otpVerificationData?.toJson(),
  };

  OtpVerificationEntity toEntity()=> OtpVerificationEntity(
    statusCode: statusCode,
    message: message,
    otpVerificationData: otpVerificationData,
  );

}

class OtpVerificationData {
  final VerifyResponse? verifyResponse;
  final String? resetToken;
  final String? message;

  OtpVerificationData({
    this.verifyResponse,
    this.resetToken,
    this.message,
  });

  OtpVerificationData copyWith({
    VerifyResponse? verifyResponse,
    String? resetToken,
    String? message,
  }) =>
      OtpVerificationData(
        verifyResponse: verifyResponse ?? this.verifyResponse,
        resetToken: resetToken ?? this.resetToken,
        message: message ?? this.message,
      );

  factory OtpVerificationData.fromRawJson(String str) => OtpVerificationData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OtpVerificationData.fromJson(Map<String, dynamic> json) => OtpVerificationData(
    verifyResponse: json["verifyResponse"] == null ? null : VerifyResponse.fromJson(json["verifyResponse"]),
    resetToken: json["resetToken"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "verifyResponse": verifyResponse?.toJson(),
    "resetToken": resetToken,
    "message": message,
  };
}

class VerifyResponse {
  final bool? success;
  final String? reason;
  final dynamic remainingAttempts;

  VerifyResponse({
    this.success,
    this.reason,
    this.remainingAttempts,
  });

  VerifyResponse copyWith({
    bool? success,
    String? reason,
    dynamic remainingAttempts,
  }) =>
      VerifyResponse(
        success: success ?? this.success,
        reason: reason ?? this.reason,
        remainingAttempts: remainingAttempts ?? this.remainingAttempts,
      );

  factory VerifyResponse.fromRawJson(String str) => VerifyResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyResponse.fromJson(Map<String, dynamic> json) => VerifyResponse(
    success: json["success"],
    reason: json["reason"],
    remainingAttempts: json["remainingAttempts"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "reason": reason,
    "remainingAttempts": remainingAttempts,
  };
}
