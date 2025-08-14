import 'package:equatable/equatable.dart';

sealed class ProgressEvent extends Equatable{}

class GetStudentProgress extends ProgressEvent{
  final String studentId;
  GetStudentProgress({required this.studentId});

  @override
  List<Object?> get props => [
    studentId
  ];
}

class SelectSubject extends ProgressEvent{
  final int subjectId;
  SelectSubject({required this.subjectId});

  @override
  List<Object?> get props => [
    subjectId
  ];
}