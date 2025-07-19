part of 'lessions_bloc.dart';

class LessionsState extends Equatable {
  final Status status;
  final String? message;

  const LessionsState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory LessionsState.initial() => const LessionsState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  LessionsState copyWith({
    Status? status,
    String? message,
  }) {
    return LessionsState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
