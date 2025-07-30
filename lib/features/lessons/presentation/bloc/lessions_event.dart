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