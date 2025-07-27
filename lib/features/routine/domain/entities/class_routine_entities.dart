

import 'package:learning_management/features/routine/data/models/class_routine_model.dart';

class ClassRoutineEntity {
  final int? statusCode;
  final String? message;
  final ClassData? classData;

  ClassRoutineEntity({
    this.statusCode,
    this.message,
    this.classData,
  });
}