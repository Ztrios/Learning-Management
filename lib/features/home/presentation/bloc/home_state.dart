part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;
  final String? message;
  final TasksEntity? tasksEntity;
  final SubjectsEntity? subjectsEntity;
  const HomeState({
    required this.status,
    required this.message,
    required this.tasksEntity,
    required this.subjectsEntity
  });

  /// Initial state factory
  factory HomeState.initial() => const HomeState(
    status: Status.initial,
    message: null,
    tasksEntity: null,
    subjectsEntity: null
  );

  /// Copy with new values
  HomeState copyWith({
    Status? status,
    String? message,
    TasksEntity? tasksEntity,
    SubjectsEntity? subjectsEntity,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      tasksEntity: tasksEntity ?? this.tasksEntity,
      subjectsEntity: subjectsEntity ?? this.subjectsEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    tasksEntity,
    subjectsEntity
  ];
}

