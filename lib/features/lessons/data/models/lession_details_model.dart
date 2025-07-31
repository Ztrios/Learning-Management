import 'dart:convert';

import 'package:learning_management/features/lessons/domain/entities/lession_details_entity.dart';

class LessionDetailsModel {
  final int? statusCode;
  final String? message;
  final LessionDetails? lessionDetails;

  LessionDetailsModel({
    this.statusCode,
    this.message,
    this.lessionDetails,
  });

  LessionDetailsModel copyWith({
    int? statusCode,
    String? message,
    LessionDetails? lessionDetails,
  }) =>
      LessionDetailsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        lessionDetails: lessionDetails ?? this.lessionDetails,
      );

  factory LessionDetailsModel.fromRawJson(String str) => LessionDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LessionDetailsModel.fromJson(Map<String, dynamic> json) => LessionDetailsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    lessionDetails: json["data"] == null ? null : LessionDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": lessionDetails?.toJson(),
  };

  LessionDetailsEntity toEntity()=> LessionDetailsEntity(
    statusCode: statusCode,
    message: message,
    lessionDetails: lessionDetails,
  );

}

class LessionDetails {
  final int? id;
  final String? title;
  final String? lessonStatus;
  final int? quizAttends;
  final int? totalQuizzes;
  final int? assignmentSubmits;
  final int? totalAssignments;
  final String? completeStatus;
  final int? subjectId;
  final List<String>? attachments;
  final int? classId;
  final String? content;

  LessionDetails({
    this.id,
    this.title,
    this.lessonStatus,
    this.quizAttends,
    this.totalQuizzes,
    this.assignmentSubmits,
    this.totalAssignments,
    this.completeStatus,
    this.subjectId,
    this.attachments,
    this.classId,
    this.content,
  });

  LessionDetails copyWith({
    int? id,
    String? title,
    String? lessonStatus,
    int? quizAttends,
    int? totalQuizzes,
    int? assignmentSubmits,
    int? totalAssignments,
    String? completeStatus,
    int? subjectId,
    List<String>? attachments,
    int? classId,
    String? content,
  }) =>
      LessionDetails(
        id: id ?? this.id,
        title: title ?? this.title,
        lessonStatus: lessonStatus ?? this.lessonStatus,
        quizAttends: quizAttends ?? this.quizAttends,
        totalQuizzes: totalQuizzes ?? this.totalQuizzes,
        assignmentSubmits: assignmentSubmits ?? this.assignmentSubmits,
        totalAssignments: totalAssignments ?? this.totalAssignments,
        completeStatus: completeStatus ?? this.completeStatus,
        subjectId: subjectId ?? this.subjectId,
        attachments: attachments ?? this.attachments,
        classId: classId ?? this.classId,
        content: content ?? this.content,
      );

  factory LessionDetails.fromRawJson(String str) => LessionDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LessionDetails.fromJson(Map<String, dynamic> json) => LessionDetails(
    id: json["id"],
    title: json["title"],
    lessonStatus: json["lessonStatus"],
    quizAttends: json["quizAttends"],
    totalQuizzes: json["totalQuizzes"],
    assignmentSubmits: json["assignmentSubmits"],
    totalAssignments: json["totalAssignments"],
    completeStatus: json["completeStatus"],
    subjectId: json["subjectId"],
    attachments: json["attachments"] == null ? [] : List<String>.from(json["attachments"]!.map((x) => x)),
    classId: json["classId"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "lessonStatus": lessonStatus,
    "quizAttends": quizAttends,
    "totalQuizzes": totalQuizzes,
    "assignmentSubmits": assignmentSubmits,
    "totalAssignments": totalAssignments,
    "completeStatus": completeStatus,
    "subjectId": subjectId,
    "attachments": attachments == null ? [] : List<dynamic>.from(attachments!.map((x) => x)),
    "classId": classId,
    "content": content,
  };
}
