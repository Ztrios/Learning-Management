part of 'progress_bloc.dart';

class ProgressState extends Equatable {
  final Status status;
  final String? message;
  final ProgressEntity? progressEntity;

  final SubjectProgress? selectedSubject;

  const ProgressState({
    required this.status,
    required this.message,
    required this.progressEntity,
    required this.selectedSubject
  });

  /// Initial state factory
  factory ProgressState.initial() => const ProgressState(
    status: Status.initial,
    message: null,
    progressEntity: null,
    selectedSubject: null
  );

  /// Copy with new values
  ProgressState copyWith({
    Status? status,
    String? message,
    ProgressEntity? progressEntity,
    SubjectProgress? selectedSubject,
  }) {
    return ProgressState(
      status: status ?? this.status,
      message: message ?? this.message,
      progressEntity: progressEntity ?? this.progressEntity,
      selectedSubject: selectedSubject ?? this.selectedSubject
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    progressEntity,
    selectedSubject
  ];
}
