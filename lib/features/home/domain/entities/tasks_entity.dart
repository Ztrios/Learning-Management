import 'package:learning_management/features/home/data/models/tasks_model.dart';

class TasksEntity {
  final int? statusCode;
  final String? message;
  final List<Task>? taskData;

  TasksEntity({
    this.statusCode,
    this.message,
    this.taskData,
  });
}