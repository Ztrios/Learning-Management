import 'dart:io';

import 'package:equatable/equatable.dart';

sealed class AuthenticationEvent extends Equatable{}


class SignIn extends AuthenticationEvent{
  final String userName;
  final String password;

  SignIn({required this.userName, required this.password});

  @override
  List<Object?> get props => [
    userName,
    password
  ];
}


class SignUp extends AuthenticationEvent{
  final File studentPhoto;
  final String email;
  final String studentName;
  final String fathersName;
  final String mothersName;
  final String district;
  final String phone;
  final String batchYear;
  final String section;
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


class GetSections extends AuthenticationEvent{
  final String batchYear;
  GetSections({required this.batchYear});

  @override
  List<Object?> get props => [
    batchYear
  ];
}