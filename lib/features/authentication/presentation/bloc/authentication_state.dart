part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final Status status;
  final Status signInStatus;
  final Status signUpStatus;
  final String? message;
  final SectionsEntity? sectionsEntity;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;

  const AuthenticationState({
    required this.status,
    required this.signInStatus,
    required this.signUpStatus,
    required this.message,
    required this.sectionsEntity,
    required this.studentEntity,
    required this.signInEntity
  });

  /// Initial state factory
  factory AuthenticationState.initial() => const AuthenticationState(
    status: Status.initial,
    signInStatus: Status.initial,
    signUpStatus: Status.initial,
    message: null,
    sectionsEntity: null,
    signInEntity: null,
    studentEntity: null
  );

  /// Copy with new values
  AuthenticationState copyWith({
    Status? status,
    Status? signInStatus,
    Status? signUpStatus,
    String? message,
    SectionsEntity? sectionsEntity,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
  }) {
    return AuthenticationState(
      status:  status ?? this.status,
      signInStatus: signInStatus ?? this.signInStatus,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      message: message ?? this.message,
      sectionsEntity: sectionsEntity ?? this.sectionsEntity,
      signInEntity: signInEntity ?? this.signInEntity,
      studentEntity: studentEntity ?? this.studentEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    signInStatus,
    signUpStatus,
    message,
    sectionsEntity,
    signInEntity,
    studentEntity
  ];
}
