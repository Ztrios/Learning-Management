import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

class RoutineState extends Equatable {
  final Status status;
  final String? message;

  const RoutineState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory RoutineState.initial() => const RoutineState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  RoutineState copyWith({
    Status? status,
    String? message,
  }) {
    return RoutineState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
