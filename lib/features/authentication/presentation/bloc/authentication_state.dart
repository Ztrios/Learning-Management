part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final Status logInStatus;
  final Status signInStatus;
  final String? message;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;

  const AuthenticationState({
    required this.logInStatus,
    required this.signInStatus,
    required this.message,
    required this.studentEntity,
    required this.signInEntity
  });

  /// Initial state factory
  factory AuthenticationState.initial() => const AuthenticationState(
    logInStatus: Status.initial,
    signInStatus: Status.initial,
    message: null,
    signInEntity: null,
    studentEntity: null
  );

  /// Copy with new values
  AuthenticationState copyWith({
    Status? logInStatus,
    Status? signInStatus,
    String? message,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
  }) {
    return AuthenticationState(
      logInStatus: logInStatus ?? this.logInStatus,
      signInStatus: signInStatus ?? this.signInStatus,
      message: message ?? this.message,
      signInEntity: signInEntity ?? this.signInEntity,
      studentEntity: studentEntity ?? this.studentEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    logInStatus,
    signInStatus,
    message,
    signInEntity,
    studentEntity
  ];
}
