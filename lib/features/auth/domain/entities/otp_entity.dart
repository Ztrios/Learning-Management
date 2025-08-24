import 'package:learning_management/features/auth/data/models/otp_model.dart';

class OtpEntity {
  final int? statusCode;
  final String? message;
  final OtpData? otpData;

  OtpEntity({
    this.statusCode,
    this.message,
    this.otpData,
  });
}