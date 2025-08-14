import 'dart:convert';

import 'package:learning_management/features/subject_details/domain/entities/lessions_list_entity.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_event.dart';

class LessionsListModel {
  final int? statusCode;
  final String? message;
  final LessionsData? lessionsData;

  LessionsListModel({
    this.statusCode,
    this.message,
    this.lessionsData,
  });

  LessionsListModel copyWith({
    int? statusCode,
    String? message,
    LessionsData? lessionsData,
  }) =>
      LessionsListModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        lessionsData: lessionsData ?? this.lessionsData,
      );

  factory LessionsListModel.fromRawJson(String str) => LessionsListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LessionsListModel.fromJson(Map<String, dynamic> json) => LessionsListModel(
    statusCode: json["statusCode"],
    message: json["message"],
    lessionsData: json["data"] == null ? null : LessionsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": lessionsData?.toJson(),
  };


  LessionsListEntity toEntity() => LessionsListEntity(
    statusCode: statusCode,
    message: message,
    lessionsData: lessionsData,
  );

}

class LessionsData {
  final int? totalLessons;
  final int? lessonComplete;
  final int? totalAssignments;
  final int? assignmentComplete;
  final int? totalQuizzes;
  final int? quizComplete;
  final List<Lesson>? lessonList;

  LessionsData({
    this.totalLessons,
    this.lessonComplete,
    this.totalAssignments,
    this.assignmentComplete,
    this.totalQuizzes,
    this.quizComplete,
    this.lessonList,
  });

  LessionsData copyWith({
    int? totalLessons,
    int? lessonComplete,
    int? totalAssignments,
    int? assignmentComplete,
    int? totalQuizzes,
    int? quizComplete,
    List<Lesson>? lessonList,
  }) =>
      LessionsData(
        totalLessons: totalLessons ?? this.totalLessons,
        lessonComplete: lessonComplete ?? this.lessonComplete,
        totalAssignments: totalAssignments ?? this.totalAssignments,
        assignmentComplete: assignmentComplete ?? this.assignmentComplete,
        totalQuizzes: totalQuizzes ?? this.totalQuizzes,
        quizComplete: quizComplete ?? this.quizComplete,
        lessonList: lessonList ?? this.lessonList,
      );

  factory LessionsData.fromRawJson(String str) => LessionsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LessionsData.fromJson(Map<String, dynamic> json) => LessionsData(
    totalLessons: json["totalLessons"],
    lessonComplete: json["lessonComplete"],
    totalAssignments: json["totalAssignments"],
    assignmentComplete: json["assignmentComplete"],
    totalQuizzes: json["totalQuizzes"],
    quizComplete: json["quizComplete"],
    lessonList: json["lessonList"] == null ? [] : List<Lesson>.from(json["lessonList"]!.map((x) => Lesson.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalLessons": totalLessons,
    "lessonComplete": lessonComplete,
    "totalAssignments": totalAssignments,
    "assignmentComplete": assignmentComplete,
    "totalQuizzes": totalQuizzes,
    "quizComplete": quizComplete,
    "lessonList": lessonList == null ? [] : List<dynamic>.from(lessonList!.map((x) => x.toJson())),
  };
}

class Lesson {
  final int? lessonId;
  final String? title;
  final String? lessonStatus;
  final int? quizAttends;
  final int? totalQuizzes;
  final int? assignmentSubmits;
  final int? totalAssignments;
  final String? completeStatus;

  Lesson({
    this.lessonId,
    this.title,
    this.lessonStatus,
    this.quizAttends,
    this.totalQuizzes,
    this.assignmentSubmits,
    this.totalAssignments,
    this.completeStatus,
  });

  Lesson copyWith({
    int? lessonId,
    String? title,
    String? lessonStatus,
    int? quizAttends,
    int? totalQuizzes,
    int? assignmentSubmits,
    int? totalAssignments,
    String? completeStatus,
  }) =>
      Lesson(
        lessonId: lessonId ?? this.lessonId,
        title: title ?? this.title,
        lessonStatus: lessonStatus ?? this.lessonStatus,
        quizAttends: quizAttends ?? this.quizAttends,
        totalQuizzes: totalQuizzes ?? this.totalQuizzes,
        assignmentSubmits: assignmentSubmits ?? this.assignmentSubmits,
        totalAssignments: totalAssignments ?? this.totalAssignments,
        completeStatus: completeStatus ?? this.completeStatus,
      );

  factory Lesson.fromRawJson(String str) => Lesson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    lessonId: json["lessonId"],
    title: json["title"],
    lessonStatus: json["lessonStatus"],
    quizAttends: json["quizAttends"],
    totalQuizzes: json["totalQuizzes"],
    assignmentSubmits: json["assignmentSubmits"],
    totalAssignments: json["totalAssignments"],
    completeStatus: json["completeStatus"],
  );

  Map<String, dynamic> toJson() => {
    "lessonId": lessonId,
    "title": title,
    "lessonStatus": lessonStatus,
    "quizAttends": quizAttends,
    "totalQuizzes": totalQuizzes,
    "assignmentSubmits": assignmentSubmits,
    "totalAssignments": totalAssignments,
    "completeStatus": completeStatus,
  };
}
