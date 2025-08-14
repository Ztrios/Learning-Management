import 'package:dartz/dartz.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/home/domain/entities/announcements_entity.dart';
import 'package:learning_management/features/home/domain/entities/subject_entity.dart';
import 'package:learning_management/features/home/domain/entities/tasks_entity.dart';
import 'package:learning_management/features/home/domain/entities/todays_class_entity.dart';

abstract class HomeRepositories {
  Future<Either<Failure,AnnouncementsEntity>> getAnnouncements();
  Future<Either<Failure, TodaysClassEntity>> getTodaysClass({required String sectionId});
  Future<Either<Failure, SubjectsEntity>> getStudentSubjects({required String studentId});
  Future<Either<Failure, TasksEntity>> getStudentTasks({required String sectionId});
}