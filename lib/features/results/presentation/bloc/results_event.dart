import 'package:equatable/equatable.dart';

sealed class ResultsEvent extends Equatable{}

class GetStudentResults extends ResultsEvent{
  final String studentId;
  GetStudentResults({required this.studentId});

  @override
  List<Object?> get props => [
    studentId
  ];
}