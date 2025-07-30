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

  final Map<String, dynamic> submitExam;

  SubmitExam({required this.submitExam});

  @override
  List<Object?> get props => [
    submitExam
  ];
}