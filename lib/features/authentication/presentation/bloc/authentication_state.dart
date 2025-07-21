part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final Status signInStatus;
  final Status signUpStatus;
  final String? message;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;

  const AuthenticationState({
    required this.signInStatus,
    required this.signUpStatus,
    required this.message,
    required this.studentEntity,
    required this.signInEntity
  });

  /// Initial state factory
  factory AuthenticationState.initial() => const AuthenticationState(
    signInStatus: Status.initial,
    signUpStatus: Status.initial,
    message: null,
    signInEntity: null,
    studentEntity: null
  );

  /// Copy with new values
  AuthenticationState copyWith({
    Status? signInStatus,
    Status? signUpStatus,
    String? message,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
  }) {
    return AuthenticationState(
      signInStatus: signInStatus ?? this.signInStatus,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      message: message ?? this.message,
      signInEntity: signInEntity ?? this.signInEntity,
      studentEntity: studentEntity ?? this.studentEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    signInStatus,
    signUpStatus,
    message,
    signInEntity,
    studentEntity
  ];
}
