part of 'lessions_bloc.dart';

class LessionsState extends Equatable {
  final Status status;
  final Status examSubmissionStatus;
  final String? message;
  final LessionsListEntity? lessionsListEntity;
  final ExamsListEntity? examsListEntity;
  final ExamDetailsEntity? examDetailsEntity;

  const LessionsState({
    required this.status,
    required this.message,
    required this.examSubmissionStatus,
    required this.lessionsListEntity,
    required this.examsListEntity,
    required this.examDetailsEntity
  });

  /// Initial state factory
  factory LessionsState.initial() => const LessionsState(
    status: Status.initial,
    examSubmissionStatus: Status.initial,
    message: null,
    lessionsListEntity: null,
    examsListEntity: null,
    examDetailsEntity: null
  );

  /// Copy with new values
  LessionsState copyWith({
    Status? status,
    Status? examSubmissionStatus,
    String? message,
    LessionsListEntity? lessionsListEntity,
    ExamsListEntity? examsListEntity,
    ExamDetailsEntity? examDetailsEntity
  }) {
    return LessionsState(
      status: status ?? this.status,
      message: message ?? this.message,
      examSubmissionStatus: examSubmissionStatus ?? this.examSubmissionStatus,
      lessionsListEntity: lessionsListEntity ?? this.lessionsListEntity,
      examsListEntity: examsListEntity ?? this.examsListEntity,
      examDetailsEntity: examDetailsEntity ?? this.examDetailsEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    examSubmissionStatus,
    message,
    lessionsListEntity,
    examsListEntity,
    examDetailsEntity
  ];
}
