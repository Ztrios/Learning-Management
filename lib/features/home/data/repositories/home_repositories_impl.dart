import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/features/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:learning_management/features/home/domain/entities/announcements_entity.dart';
import 'package:learning_management/features/home/domain/entities/subject_entity.dart';
import 'package:learning_management/features/home/domain/entities/tasks_entity.dart';
import 'package:learning_management/features/home/domain/entities/todays_class_entity.dart';
import 'package:learning_management/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl implements HomeRepositories{

  @override
  Future<Either<Failure, AnnouncementsEntity>> getAnnouncements() async =>
      await sl<HomeRemoteDataSource>().getAnnouncements();

  @override
  Future<Either<Failure, TodaysClassEntity>> getTodaysClass({required String sectionId}) async =>
      await sl<HomeRemoteDataSource>().getTodaysClass(sectionId: sectionId);

  @override
  Future<Either<Failure, SubjectsEntity>> getStudentSubjects({required String studentId}) async =>
      await sl<HomeRemoteDataSource>().getStudentSubjects(studentId: studentId);

  @override
  Future<Either<Failure, TasksEntity>> getStudentTasks({required String sectionId}) async =>
      await sl<HomeRemoteDataSource>().getStudentTasks(sectionId: sectionId);


}