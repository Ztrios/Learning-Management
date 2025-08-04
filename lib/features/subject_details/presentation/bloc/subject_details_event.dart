import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:learning_management/features/subject_details/domain/entities/answer_entity.dart';

sealed class SubjectDetailsEvent extends Equatable{}

class GetLessionsList extends SubjectDetailsEvent{

  final String subjectId;

  GetLessionsList({required this.subjectId});

  @override
  List<Object?> get props => [
    subjectId
  ];
}


class GetLessionDetails extends SubjectDetailsEvent{

  final String lessionId;

  GetLessionDetails({required this.lessionId});

  @override
  List<Object?> get props => [
    lessionId
  ];
}


class GetAssignmentList extends SubjectDetailsEvent{

  final String lessionId;

  GetAssignmentList({required this.lessionId});

  @override
  List<Object?> get props => [
    lessionId
  ];
}


class GetAssignmentDetails extends SubjectDetailsEvent{

  final String assignmentId;

  GetAssignmentDetails({required this.assignmentId});

  @override
  List<Object?> get props => [
    assignmentId
  ];
}



class AssignmentSubmit extends SubjectDetailsEvent{

  final Map<String, dynamic> body;

  AssignmentSubmit({required this.body});

  @override
  List<Object?> get props => [
    body
  ];
}


class GetQuizList extends SubjectDetailsEvent{

  final String lessionId;

  GetQuizList({required this.lessionId});

  @override
  List<Object?> get props => [
    lessionId
  ];
}


class GetQuestionsList extends SubjectDetailsEvent{
  final String quizId;

  GetQuestionsList({required this.quizId});

  @override
  List<Object?> get props => [
    quizId
  ];
}


class QuizSubmit extends SubjectDetailsEvent{

  final String studentId;
  final String quizId;

  QuizSubmit({
    required this.studentId,
    required this.quizId
  });

  @override
  List<Object?> get props => [
    studentId,
    quizId
  ];
}


class SelectOrUpdateAnswer extends SubjectDetailsEvent{
  final int questionId;
  final int? selectedIndex;
  final String? writtenAnswer;

  final QuestionType questionType;
  SelectOrUpdateAnswer({
    this.selectedIndex,
    this.writtenAnswer,
    required this.questionId,
    required this.questionType
  });

  @override
  List<Object?> get props => [
    questionId,
    selectedIndex,
    writtenAnswer,
    questionType
  ];
}


class GetExamsList extends SubjectDetailsEvent{

  final String subjectId;

  GetExamsList({required this.subjectId});

  @override
  List<Object?> get props => [
    subjectId
  ];
}


class GetExamsDetails extends SubjectDetailsEvent{

  final String examId;

  GetExamsDetails({required this.examId});

  @override
  List<Object?> get props => [
    examId
  ];
}


class SubmitExam extends SubjectDetailsEvent{

  final Map<String, dynamic> body;

  SubmitExam({required this.body});

  @override
  List<Object?> get props => [
    body
  ];
}