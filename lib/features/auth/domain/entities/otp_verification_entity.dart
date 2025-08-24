import 'package:learning_management/features/auth/data/models/otp_verification_model.dart';

class OtpVerificationEntity {
  final int? statusCode;
  final String? message;
  final OtpVerificationData? otpVerificationData;

  OtpVerificationEntity({
    this.statusCode,
    this.message,
    this.otpVerificationData,
  });
}