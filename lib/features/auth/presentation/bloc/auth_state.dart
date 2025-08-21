part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status status;
  final String? message;
  final Status signInStatus;
  final Status signUpStatus;
  final Status resetPasswordStatus;
  final bool rememberUser;
  final SectionsEntity? sectionsEntity;
  final StandardsEntity? standardsEntity;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;

  const AuthState({
    required this.status,
    required this.message,
    required this.signInStatus,
    required this.signUpStatus,
    required this.resetPasswordStatus,
    required this.rememberUser,
    required this.sectionsEntity,
    required this.standardsEntity,
    required this.studentEntity,
    required this.signInEntity,
  });

  /// Initial state factory
  factory AuthState.initial() => const AuthState(
    status: Status.initial,
    message: null,
    signInStatus: Status.initial,
    signUpStatus: Status.initial,
    resetPasswordStatus: Status.initial,
    rememberUser: false,
    sectionsEntity: null,
    standardsEntity: null,
    signInEntity: null,
    studentEntity: null
  );

  /// Copy with new values
  AuthState copyWith({
    Status? status,
    String? message,
    Status? signInStatus,
    Status? signUpStatus,
    Status? resetPasswordStatus,
    bool? rememberUser,
    SectionsEntity? sectionsEntity,
    StandardsEntity? standardsEntity,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
  }) {
    return AuthState(
      status:  status ?? this.status,
      message: message ?? this.message,
      signInStatus: signInStatus ?? this.signInStatus,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      rememberUser: rememberUser ?? this.rememberUser,
      sectionsEntity: sectionsEntity ?? this.sectionsEntity,
      standardsEntity: standardsEntity ?? this.standardsEntity,
      signInEntity: signInEntity ?? this.signInEntity,
      studentEntity: studentEntity ?? this.studentEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    signInStatus,
    signUpStatus,
    resetPasswordStatus,
    rememberUser,
    sectionsEntity,
    standardsEntity,
    signInEntity,
    studentEntity
  ];
}
