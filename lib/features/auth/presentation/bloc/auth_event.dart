import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';

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


class SignOut extends AuthEvent{
  @override
  List<Object?> get props => [];
}


class GetSections extends AuthEvent{
  final String batchYear;
  GetSections({required this.batchYear});

  @override
  List<Object?> get props => [
    batchYear
  ];
}

class SaveSignInEntity extends AuthEvent{
  @override
  List<Object?> get props => [];
}

class GetSignInEntity extends AuthEvent{
  @override
  List<Object?> get props => [];
}
