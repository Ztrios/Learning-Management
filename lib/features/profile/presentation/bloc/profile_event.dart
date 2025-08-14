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


class UpdateStudentProfile extends ProfileEvent{
  final String studentId;
  final Map<String, dynamic> body;
  UpdateStudentProfile({
    required this.studentId,
    required this.body
  });

  @override
  List<Object?> get props => [
    studentId,
    body
  ];
}
