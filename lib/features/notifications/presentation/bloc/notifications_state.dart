import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

class NotificationState extends Equatable {
  final Status status;
  final String? message;

  const NotificationState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory NotificationState.initial() => const NotificationState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  NotificationState copyWith({
    Status? status,
    String? message,
  }) {
    return NotificationState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
