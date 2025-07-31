import 'package:equatable/equatable.dart';

sealed class LessionsEvent extends Equatable{}

class GetLessionsList extends LessionsEvent{

  final String subjectId;

  GetLessionsList({required this.subjectId});

  @override
  List<Object?> get props => [
    subjectId
  ];
}


class GetLessionDetails extends LessionsEvent{

  final String lessionId;

  GetLessionDetails({required this.lessionId});

  @override
  List<Object?> get props => [
    lessionId
  ];
}


class GetExamsList extends LessionsEvent{

  final String subjectId;

  GetExamsList({required this.subjectId});

  @override
  List<Object?> get props => [
    subjectId
  ];
}


class GetExamsDetails extends LessionsEvent{

  final String examId;

  GetExamsDetails({required this.examId});

  @override
  List<Object?> get props => [
    examId
  ];
}


class SubmitExam extends LessionsEvent{

  final Map<String, dynamic> body;

  SubmitExam({required this.body});

  @override
  List<Object?> get props => [
    body
  ];
}