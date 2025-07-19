import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

class ProgressState extends Equatable {
  final Status status;
  final String? message;

  const ProgressState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory ProgressState.initial() => const ProgressState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  ProgressState copyWith({
    Status? status,
    String? message,
  }) {
    return ProgressState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
