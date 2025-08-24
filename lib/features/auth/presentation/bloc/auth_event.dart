import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class AuthEvent extends Equatable{}


class SignIn extends AuthEvent{
  final bool rememberStudent;
  final String userName;
  final String password;

  SignIn({
    required this.rememberStudent,
    required this.userName,
    required this.password
  });

  @override
  List<Object?> get props => [
    rememberStudent,
    userName,
    password
  ];
}


class SignUp extends AuthEvent{
  final File studentPhoto;
  final String email;
  final String studentName;
  final String fathersName;
  final String mothersName;
  final String district;
  final String phone;
  final String batchYear;
  final String section;
  final String gender;
  final String password;

  SignUp({
    required this.studentPhoto,
    required this.email,
    required this.studentName,
    required this.fathersName,
    required this.mothersName,
    required this.district,
    required this.phone,
    required this.batchYear,
    required this.section,
    required this.gender,
    required this.password
  });

  @override
  List<Object?> get props => [
    studentPhoto,
    email,
    studentName,
    fathersName,
    mothersName,
    district,
    phone,
    batchYear,
    section,
    password
  ];
}


class SendOTP extends AuthEvent{
  final String phone;
  SendOTP({required this.phone});

  @override
  List<Object?> get props => [
    phone
  ];
}


class VerifyOTP extends AuthEvent{
  final String phone;
  final String otp;
  final bool fromForgetPassword;

  VerifyOTP({
    required this.phone,
    required this.otp,
    required this.fromForgetPassword
  });

  @override
  List<Object?> get props => [
    phone,
    otp,
    fromForgetPassword
  ];
}



class ResetPassword extends AuthEvent{
  final String resetToken;
  final String newPassword;

  ResetPassword({
    required this.resetToken,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [
    resetToken,
    newPassword
  ];
}

class SignOut extends AuthEvent{
  @override
  List<Object?> get props => [];
}


class GetSections extends AuthEvent{
  Map<String,dynamic> query;
  GetSections({required this.query});

  @override
  List<Object?> get props => [
    query
  ];
}


class GetStandards extends AuthEvent{
  GetStandards();

  @override
  List<Object?> get props => [];
}


class SaveSignInEntity extends AuthEvent{
  @override
  List<Object?> get props => [];
}

class GetSignInEntity extends AuthEvent{
  @override
  List<Object?> get props => [];
}



class RememberUser extends AuthEvent{
  @override
  List<Object?> get props => [];
}

class CheckRememberUser extends AuthEvent{
  @override
  List<Object?> get props => [];
}

