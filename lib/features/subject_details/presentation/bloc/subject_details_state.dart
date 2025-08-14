part of 'subject_details_bloc.dart';

class SubjectDetailsState extends Equatable {
  final Status status;
  final Status examSubmissionStatus;
  final Status assignmentSubmissionStatus;
  final Status quizSubmissionStatus;
  final String? message;
  final LessionsListEntity? lessionsListEntity;
  final LessionDetailsEntity? lessionDetailsEntity;
  final AssignmentListEntity? assignmentListEntity;
  final AssignmentDetailsEntity? assignmentDetailsEntity;
  final QuizListEntity? quizListEntity;
  final List<AnswerEntity> selectedAnswerEntities;
  final QuestionsListEntity? questionsListEntity;
  final ExamsListEntity? examsListEntity;
  final ExamDetailsEntity? examDetailsEntity;


  const SubjectDetailsState({
    required this.status,
    required this.message,
    required this.examSubmissionStatus,
    required this.assignmentSubmissionStatus,
    required this.quizSubmissionStatus,
    required this.lessionsListEntity,
    required this.assignmentListEntity,
    required this.assignmentDetailsEntity,
    required this.quizListEntity,
    required this.questionsListEntity,
    required this.selectedAnswerEntities,
    required this.lessionDetailsEntity,
    required this.examsListEntity,
    required this.examDetailsEntity
  });

  /// Initial state factory
  factory SubjectDetailsState.initial() => const SubjectDetailsState(
    status: Status.initial,
    examSubmissionStatus: Status.initial,
    assignmentSubmissionStatus: Status.initial,
    quizSubmissionStatus: Status.initial,
    message: null,
    lessionsListEntity: null,
    quizListEntity: null,
    questionsListEntity: null,
    selectedAnswerEntities: [],
    lessionDetailsEntity: null,
    assignmentListEntity: null,
    assignmentDetailsEntity: null,
    examsListEntity: null,
    examDetailsEntity: null
  );

  /// Copy with new values
  SubjectDetailsState copyWith({
    Status? status,
    Status? examSubmissionStatus,
    Status? assignmentSubmissionStatus,
    Status? quizSubmissionStatus,
    String? message,
    LessionsListEntity? lessionsListEntity,
    LessionDetailsEntity? lessionDetailsEntity,
    AssignmentListEntity? assignmentListEntity,
    AssignmentDetailsEntity? assignmentDetailsEntity,
    QuizListEntity? quizListEntity,
    QuestionsListEntity? questionsListEntity,
    List<AnswerEntity>? selectedAnswerEntities,
    ExamsListEntity? examsListEntity,
    ExamDetailsEntity? examDetailsEntity
  }) {
    return SubjectDetailsState(
      status: status ?? this.status,
      message: message ?? this.message,
      examSubmissionStatus: examSubmissionStatus ?? this.examSubmissionStatus,
      assignmentSubmissionStatus: assignmentSubmissionStatus ?? this.assignmentSubmissionStatus,
      quizSubmissionStatus: quizSubmissionStatus ?? this.quizSubmissionStatus,
      lessionsListEntity: lessionsListEntity ?? this.lessionsListEntity,
      lessionDetailsEntity: lessionDetailsEntity ?? this.lessionDetailsEntity,
      assignmentListEntity: assignmentListEntity ?? this.assignmentListEntity,
      assignmentDetailsEntity: assignmentDetailsEntity ?? this.assignmentDetailsEntity,
      quizListEntity: quizListEntity ?? this.quizListEntity,
      questionsListEntity: questionsListEntity ?? this.questionsListEntity,
      selectedAnswerEntities: selectedAnswerEntities ?? this.selectedAnswerEntities,
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
    quizSubmissionStatus,
    message,
    lessionsListEntity,
    lessionDetailsEntity,
    assignmentListEntity,
    assignmentDetailsEntity,
    quizListEntity,
    questionsListEntity,
    selectedAnswerEntities,
    examsListEntity,
    examDetailsEntity
  ];
}
