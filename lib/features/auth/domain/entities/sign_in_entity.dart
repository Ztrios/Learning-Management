import 'dart:convert';

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

  SignInEntity copyWith({
    int? statusCode,
    String? message,
    SignInData? signInData
  }) => SignInEntity(
    statusCode: statusCode ?? this.statusCode,
    message: message ?? this.message,
    signInData: signInData ?? this.signInData
  );

  factory SignInEntity.fromRawJson(String str)=> SignInEntity.fromJson(jsonDecode(str));

  String toRawJson()=> jsonEncode(toJson());

  factory SignInEntity.fromJson(Map<String,dynamic> json)=> SignInEntity(
    signInData: SignInData.fromJson(json["signInData"])
  );

  Map<String,dynamic> toJson()=>{
    "signInData" : signInData?.toJson(),
  };

}