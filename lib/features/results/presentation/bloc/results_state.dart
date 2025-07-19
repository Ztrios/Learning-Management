import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

class ResultsState extends Equatable {
  final Status status;
  final String? message;

  const ResultsState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory ResultsState.initial() => const ResultsState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  ResultsState copyWith({
    Status? status,
    String? message,
  }) {
    return ResultsState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
