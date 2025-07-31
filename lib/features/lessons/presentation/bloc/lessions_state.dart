part of 'lessions_bloc.dart';

class LessionsState extends Equatable {
  final Status status;
  final Status examSubmissionStatus;
  final Status assignmentSubmissionStatus;
  final String? message;
  final LessionsListEntity? lessionsListEntity;
  final LessionDetailsEntity? lessionDetailsEntity;
  final AssignmentListEntity? assignmentListEntity;
  final AssignmentDetailsEntity? assignmentDetailsEntity;
  final QuizListEntity? quizListEntity;
  final ExamsListEntity? examsListEntity;
  final ExamDetailsEntity? examDetailsEntity;

  const LessionsState({
    required this.status,
    required this.message,
    required this.examSubmissionStatus,
    required this.assignmentSubmissionStatus,
    required this.lessionsListEntity,
    required this.assignmentListEntity,
    required this.assignmentDetailsEntity,
    required this.quizListEntity,
    required this.lessionDetailsEntity,
    required this.examsListEntity,
    required this.examDetailsEntity
  });

  /// Initial state factory
  factory LessionsState.initial() => const LessionsState(
    status: Status.initial,
    examSubmissionStatus: Status.initial,
    assignmentSubmissionStatus: Status.initial,
    message: null,
    lessionsListEntity: null,
    quizListEntity: null,
    lessionDetailsEntity: null,
    assignmentListEntity: null,
    assignmentDetailsEntity: null,
    examsListEntity: null,
    examDetailsEntity: null
  );

  /// Copy with new values
  LessionsState copyWith({
    Status? status,
    Status? examSubmissionStatus,
    Status? assignmentSubmissionStatus,
    String? message,
    LessionsListEntity? lessionsListEntity,
    LessionDetailsEntity? lessionDetailsEntity,
    AssignmentListEntity? assignmentListEntity,
    AssignmentDetailsEntity? assignmentDetailsEntity,
    QuizListEntity? quizListEntity,
    ExamsListEntity? examsListEntity,
    ExamDetailsEntity? examDetailsEntity
  }) {
    return LessionsState(
      status: status ?? this.status,
      message: message ?? this.message,
      examSubmissionStatus: examSubmissionStatus ?? this.examSubmissionStatus,
      assignmentSubmissionStatus: assignmentSubmissionStatus ?? this.assignmentSubmissionStatus,
      lessionsListEntity: lessionsListEntity ?? this.lessionsListEntity,
      lessionDetailsEntity: lessionDetailsEntity ?? this.lessionDetailsEntity,
      assignmentListEntity: assignmentListEntity ?? this.assignmentListEntity,
      assignmentDetailsEntity: assignmentDetailsEntity ?? this.assignmentDetailsEntity,
      quizListEntity: quizListEntity ?? this.quizListEntity,
      examsListEntity: examsListEntity ?? this.examsListEntity,
      examDetailsEntity: examDetailsEntity ?? this.examDetailsEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    examSubmissionStatus,
    assignmentSubmissionStatus,
    message,
    lessionsListEntity,
    lessionDetailsEntity,
    assignmentListEntity,
    assignmentDetailsEntity,
    quizListEntity,
    examsListEntity,
    examDetailsEntity
  ];
}
