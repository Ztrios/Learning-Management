import 'dart:convert';

import 'package:learning_management/features/lessons/domain/entities/assignment_list_entity.dart';

class AssignmentListModel {
  final int? statusCode;
  final String? message;
  final List<Assignment>? assignments;

  AssignmentListModel({
    this.statusCode,
    this.message,
    this.assignments,
  });

  AssignmentListModel copyWith({
    int? statusCode,
    String? message,
    List<Assignment>? assignments,
  }) =>
      AssignmentListModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        assignments: assignments ?? this.assignments,
      );

  factory AssignmentListModel.fromRawJson(String str) => AssignmentListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignmentListModel.fromJson(Map<String, dynamic> json) => AssignmentListModel(
    statusCode: json["statusCode"],
    message: json["message"],
    assignments: json["data"] == null ? [] : List<Assignment>.from(json["data"]!.map((x) => Assignment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": assignments == null ? [] : List<dynamic>.from(assignments!.map((x) => x.toJson())),
  };

  AssignmentListEntity toEntity() => AssignmentListEntity(
    statusCode: statusCode,
    message: message,
    assignments: assignments,
  );

}

class Assignment {
  final int? id;
  final int? assignmentSubmissionId;
  final String? title;
  final DateTime? deadline;
  final double? totalMarks;
  final double? earnedMarks;
  final String? status;

  Assignment({
    this.id,
    this.assignmentSubmissionId,
    this.title,
    this.deadline,
    this.totalMarks,
    this.earnedMarks,
    this.status,
  });

  Assignment copyWith({
    int? id,
    int? assignmentSubmissionId,
    String? title,
    DateTime? deadline,
    double? totalMarks,
    double? earnedMarks,
    String? status,
  }) =>
      Assignment(
        id: id ?? this.id,
        assignmentSubmissionId: assignmentSubmissionId ?? this.assignmentSubmissionId,
        title: title ?? this.title,
        deadline: deadline ?? this.deadline,
        totalMarks: totalMarks ?? this.totalMarks,
        earnedMarks: earnedMarks ?? this.earnedMarks,
        status: status ?? this.status,
      );

  factory Assignment.fromRawJson(String str) => Assignment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
    id: json["id"],
    assignmentSubmissionId: json["assignmentSubmissionId"],
    title: json["title"],
    deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
    totalMarks: json["totalMarks"],
    earnedMarks: json["earnedMarks"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "assignmentSubmissionId": assignmentSubmissionId,
    "title": title,
    "deadline": deadline?.toIso8601String(),
    "totalMarks": totalMarks,
    "earnedMarks": earnedMarks,
    "status": status,
  };
}
