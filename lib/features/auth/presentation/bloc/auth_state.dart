part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status status;
  final String? message;
  final Status signInStatus;
  final Status signUpStatus;
  final Status resetPasswordStatus;
  final SectionsEntity? sectionsEntity;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;

  const AuthState({
    required this.status,
    required this.message,
    required this.signInStatus,
    required this.signUpStatus,
    required this.resetPasswordStatus,
    required this.sectionsEntity,
    required this.studentEntity,
    required this.signInEntity
  });

  /// Initial state factory
  factory AuthState.initial() => const AuthState(
    status: Status.initial,
    message: null,
    signInStatus: Status.initial,
    signUpStatus: Status.initial,
    resetPasswordStatus: Status.initial,
    sectionsEntity: null,
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
    SectionsEntity? sectionsEntity,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
  }) {
    return AuthState(
      status:  status ?? this.status,
      message: message ?? this.message,
      signInStatus: signInStatus ?? this.signInStatus,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      resetPasswordStatus: resetPasswordStatus ?? this.resetPasswordStatus,
      sectionsEntity: sectionsEntity ?? this.sectionsEntity,
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
    sectionsEntity,
    signInEntity,
    studentEntity
  ];
}
