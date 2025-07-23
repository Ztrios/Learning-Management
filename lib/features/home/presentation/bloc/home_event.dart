import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable{}

class InitialEvent extends HomeEvent{
  @override
  List<Object?> get props => [];
}


class GetStudentTasks extends HomeEvent{
  final String sectionId;

  GetStudentTasks({required this.sectionId});

  @override
  List<Object?> get props => [
    sectionId
  ];
}


class GetStudentSubjects extends HomeEvent{
  final String studentId;

  GetStudentSubjects({required this.studentId});

  @override
  List<Object?> get props => [
    studentId
  ];
}