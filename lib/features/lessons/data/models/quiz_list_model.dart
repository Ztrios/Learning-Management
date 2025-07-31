import 'dart:convert';

import 'package:learning_management/features/lessons/domain/entities/quiz_list_entity.dart';

class QuizListModel {
  final int? statusCode;
  final String? message;
  final List<Quiz>? quizzes;

  QuizListModel({
    this.statusCode,
    this.message,
    this.quizzes,
  });

  QuizListModel copyWith({
    int? statusCode,
    String? message,
    List<Quiz>? quizzes,
  }) =>
      QuizListModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        quizzes: quizzes ?? this.quizzes,
      );

  factory QuizListModel.fromRawJson(String str) => QuizListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuizListModel.fromJson(Map<String, dynamic> json) => QuizListModel(
    statusCode: json["statusCode"],
    message: json["message"],
    quizzes: json["data"] == null ? [] : List<Quiz>.from(json["data"]!.map((x) => Quiz.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": quizzes == null ? [] : List<dynamic>.from(quizzes!.map((x) => x.toJson())),
  };

  QuizListEntity toEntity()=> QuizListEntity(
    statusCode: statusCode,
    message: message,
    quizzes: quizzes,
  );

}

class Quiz {
  final int? id;
  final int? quizSubmissionId;
  final String? title;
  final dynamic deadline;
  final DateTime? quizDate;
  final dynamic startTime;
  final dynamic endTime;
  final double? totalMarks;
  final double? earnedMarks;
  final String? status;

  Quiz({
    this.id,
    this.quizSubmissionId,
    this.title,
    this.deadline,
    this.quizDate,
    this.startTime,
    this.endTime,
    this.totalMarks,
    this.earnedMarks,
    this.status,
  });

  Quiz copyWith({
    int? id,
    int? quizSubmissionId,
    String? title,
    dynamic deadline,
    DateTime? quizDate,
    dynamic startTime,
    dynamic endTime,
    double? totalMarks,
    double? earnedMarks,
    String? status,
  }) =>
      Quiz(
        id: id ?? this.id,
        quizSubmissionId: quizSubmissionId ?? this.quizSubmissionId,
        title: title ?? this.title,
        deadline: deadline ?? this.deadline,
        quizDate: quizDate ?? this.quizDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        totalMarks: totalMarks ?? this.totalMarks,
        earnedMarks: earnedMarks ?? this.earnedMarks,
        status: status ?? this.status,
      );

  factory Quiz.fromRawJson(String str) => Quiz.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
    id: json["id"],
    quizSubmissionId: json["quizSubmissionId"],
    title: json["title"],
    deadline: json["deadline"],
    quizDate: json["quizDate"] == null ? null : DateTime.parse(json["quizDate"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    totalMarks: json["totalMarks"],
    earnedMarks: json["earnedMarks"]?.toDouble(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quizSubmissionId": quizSubmissionId,
    "title": title,
    "deadline": deadline,
    "quizDate": "${quizDate!.year.toString().padLeft(4, '0')}-${quizDate!.month.toString().padLeft(2, '0')}-${quizDate!.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endTime": endTime,
    "totalMarks": totalMarks,
    "earnedMarks": earnedMarks,
    "status": status,
  };
}
