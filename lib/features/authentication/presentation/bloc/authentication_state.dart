part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final Status status;
  final String? message;
  final SignInEntity? signInEntity;
  final StudentEntity? studentEntity;

  const AuthenticationState({
    required this.status,
    required this.message,
    required this.studentEntity,
    required this.signInEntity
  });

  /// Initial state factory
  factory AuthenticationState.initial() => const AuthenticationState(
    status: Status.initial,
    message: null,
    signInEntity: null,
    studentEntity: null
  );

  /// Copy with new values
  AuthenticationState copyWith({
    Status? status,
    String? message,
    SignInEntity? signInEntity,
    StudentEntity? studentEntity,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      message: message ?? this.message,
      signInEntity: signInEntity ?? this.signInEntity,
      studentEntity: studentEntity ?? this.studentEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
  ];
}
