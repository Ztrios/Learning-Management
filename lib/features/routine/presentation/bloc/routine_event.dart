import 'package:equatable/equatable.dart';

sealed class RoutineEvent extends Equatable{}

class GetClassRoutines extends RoutineEvent{
  final String sectionID;
  final DateTime selectedDateTime;

  GetClassRoutines({
    required this.sectionID,
    required this.selectedDateTime
  });

  @override
  List<Object?> get props => [
    sectionID,
    selectedDateTime
  ];

}