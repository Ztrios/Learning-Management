import 'dart:convert';

import 'package:learning_management/features/home/domain/entities/tasks_entity.dart';

class TasksModel {
  final int? statusCode;
  final String? message;
  final List<Task>? taskData;

  TasksModel({
    this.statusCode,
    this.message,
    this.taskData,
  });

  TasksModel copyWith({
    int? statusCode,
    String? message,
    List<Task>? taskData,
  }) =>
      TasksModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        taskData: taskData ?? this.taskData,
      );

  factory TasksModel.fromRawJson(String str) => TasksModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
    statusCode: json["statusCode"],
    message: json["message"],
    taskData: json["data"] == null ? [] : List<Task>.from(json["data"]!.map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": taskData == null ? [] : List<dynamic>.from(taskData!.map((x) => x.toJson())),
  };

  TasksEntity toEntity()=> TasksEntity(
    statusCode: statusCode,
    message: message,
    taskData: taskData,
  );

}

class Task {
  final int? id;
  final String? title;
  final String? subjectName;
  final int? noOfQuestion;
  final String? description;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? type;
  final double? totalMarks;

  Task({
    this.id,
    this.title,
    this.subjectName,
    this.noOfQuestion,
    this.description,
    this.startTime,
    this.endTime,
    this.type,
    this.totalMarks,
  });

  Task copyWith({
    int? id,
    String? title,
    String? subjectName,
    int? noOfQuestion,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? type,
    double? totalMarks,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        subjectName: subjectName ?? this.subjectName,
        noOfQuestion: noOfQuestion ?? this.noOfQuestion,
        description: description ?? this.description,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        type: type ?? this.type,
        totalMarks: totalMarks ?? this.totalMarks,
      );

  factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    title: json["title"],
    subjectName: json["subjectName"],
    noOfQuestion: json["noOFQuestion"],
    description: json["description"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
    type: json["type"],
    totalMarks: json["totalMarks"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subjectName": subjectName,
    "noOFQuestion": noOfQuestion,
    "description": description,
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "type": type,
    "totalMarks": totalMarks,
  };
}
