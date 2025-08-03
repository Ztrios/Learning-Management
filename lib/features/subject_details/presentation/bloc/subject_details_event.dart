import 'package:equatable/equatable.dart';

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