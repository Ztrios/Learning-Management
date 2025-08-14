part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final Status status;
  final String? message;
  final StudentProfileEntity? studentProfileEntity;
  const ProfileState({
    required this.status,
    required this.message,
    required this.studentProfileEntity
  });

  /// Initial state factory
  factory ProfileState.initial() => const ProfileState(
    status: Status.initial,
    message: null,
    studentProfileEntity: null
  );

  /// Copy with new values
  ProfileState copyWith({
    Status? status,
    String? message,
    StudentProfileEntity? studentProfileEntity
  }) {
    return ProfileState(
      status: status ?? this.status,
      message: message ?? this.message,
      studentProfileEntity: studentProfileEntity ?? this.studentProfileEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    studentProfileEntity
  ];
}
