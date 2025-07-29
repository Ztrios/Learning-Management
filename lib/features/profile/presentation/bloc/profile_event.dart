import 'package:equatable/equatable.dart';

sealed class ProfileEvent extends Equatable{}

class GetStudentProfile extends ProfileEvent{
  final String studentId;
  GetStudentProfile({required this.studentId});

  @override
  List<Object?> get props => [
    studentId
  ];
}

