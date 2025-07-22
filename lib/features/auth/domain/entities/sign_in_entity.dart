import 'package:learning_management/features/auth/data/models/sign_in_model.dart';

class SignInEntity {
  final int? statusCode;
  final String? message;
  final SignInData? signInData;

  SignInEntity({
    this.statusCode,
    this.message,
    this.signInData,
  });
}