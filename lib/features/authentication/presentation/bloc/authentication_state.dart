part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final Status status;
  final String? message;

  const AuthenticationState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory AuthenticationState.initial() => const AuthenticationState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  AuthenticationState copyWith({
    Status? status,
    String? message,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
