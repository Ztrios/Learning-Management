part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Status status;
  final String? message;
  final AnnouncementsEntity? announcementsEntity;
  final TodaysClassEntity? todaysClassEntity;
  final TasksEntity? tasksEntity;
  final SubjectsEntity? subjectsEntity;
  const HomeState({
    required this.status,
    required this.message,
    required this.announcementsEntity,
    required this.todaysClassEntity,
    required this.tasksEntity,
    required this.subjectsEntity
  });

  /// Initial state factory
  factory HomeState.initial() => const HomeState(
    status: Status.initial,
    message: null,
    announcementsEntity: null,
    todaysClassEntity: null,
    tasksEntity: null,
    subjectsEntity: null
  );

  /// Copy with new values
  HomeState copyWith({
    Status? status,
    String? message,
    AnnouncementsEntity? announcementEntity,
    TodaysClassEntity? todaysClassEntity,
    TasksEntity? tasksEntity,
    SubjectsEntity? subjectsEntity,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      announcementsEntity: announcementEntity ?? this.announcementsEntity,
      todaysClassEntity: todaysClassEntity ?? this.todaysClassEntity,
      tasksEntity: tasksEntity ?? this.tasksEntity,
      subjectsEntity: subjectsEntity ?? this.subjectsEntity
    );
  }

  /// Equatable props — always last
  @override
  List<Object?> get props => [
    status,
    message,
    announcementsEntity,
    todaysClassEntity,
    tasksEntity,
    subjectsEntity
  ];
}

