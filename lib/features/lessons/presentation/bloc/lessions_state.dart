part of 'lessions_bloc.dart';

class LessionsState extends Equatable {
  final Status status;
  final String? message;
  final LessionsListEntity? lessionsListEntity;
  final ExamsListEntity? examsListEntity;

  const LessionsState({
    required this.status,
    required this.message,
    required this.lessionsListEntity,
    required this.examsListEntity
  });

  /// Initial state factory
  factory LessionsState.initial() => const LessionsState(
    status: Status.initial,
    message: null,
    lessionsListEntity: null,
    examsListEntity: null
  );

  /// Copy with new values
  LessionsState copyWith({
    Status? status,
    String? message,
    LessionsListEntity? lessionsListEntity,
    ExamsListEntity? examsListEntity
  }) {
    return LessionsState(
      status: status ?? this.status,
      message: message ?? this.message,
      lessionsListEntity: lessionsListEntity ?? this.lessionsListEntity,
      examsListEntity: examsListEntity ?? this.examsListEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    lessionsListEntity,
    examsListEntity
  ];
}
