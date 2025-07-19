import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

class ProfileState extends Equatable {
  final Status status;
  final String? message;

  const ProfileState({
    required this.status,
    required this.message,
  });

  /// Initial state factory
  factory ProfileState.initial() => const ProfileState(
    status: Status.initial,
    message: null,
  );

  /// Copy with new values
  ProfileState copyWith({
    Status? status,
    String? message,
  }) {
    return ProfileState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [status, message];
}
