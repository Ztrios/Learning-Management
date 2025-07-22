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


  factory SignInEntity.fromRawJson(String str)=> SignInEntity.fromJson(jsonDecode(str));

  String toRawJson()=> jsonEncode(toJson());

  factory SignInEntity.fromJson(Map<String,dynamic> json)=> SignInEntity(
    signInData: SignInData.fromJson(json["signInData"])
  );

  Map<String,dynamic> toJson()=>{
    "signInData" : signInData?.toJson(),
  };

}