part of 'routine_bloc.dart';

class RoutineState extends Equatable {
  final Status status;
  final String? message;
  final DateTime selectedDate;
  final ClassRoutineEntity? classRoutineEntity;

  const RoutineState({
    required this.status,
    required this.message,
    required this.selectedDate,
    required this.classRoutineEntity
  });

  /// Initial state factory
  factory RoutineState.initial() => RoutineState(
    status: Status.initial,
    message: null,
    selectedDate: DateTime.now(),
    classRoutineEntity: null,
  );

  /// Copy with new values
  RoutineState copyWith({
    Status? status,
    String? message,
    DateTime? selectedDate,
    ClassRoutineEntity? classRoutineEntity
  }) {
    return RoutineState(
      status: status ?? this.status,
      message: message ?? this.message,
      selectedDate: selectedDate ?? this.selectedDate,
      classRoutineEntity: classRoutineEntity ?? this.classRoutineEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    selectedDate,
    classRoutineEntity
  ];
}
