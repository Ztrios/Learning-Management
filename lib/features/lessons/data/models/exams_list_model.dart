import 'dart:convert';

import 'package:learning_management/features/lessons/domain/entities/exams_list_entity.dart';

class ExamsListModel {
  final int? statusCode;
  final String? message;
  final List<Exam>? exams;

  ExamsListModel({
    this.statusCode,
    this.message,
    this.exams,
  });

  ExamsListModel copyWith({
    int? statusCode,
    String? message,
    List<Exam>? exams,
  }) =>
      ExamsListModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        exams: exams ?? this.exams,
      );

  factory ExamsListModel.fromRawJson(String str) => ExamsListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExamsListModel.fromJson(Map<String, dynamic> json) => ExamsListModel(
    statusCode: json["statusCode"],
    message: json["message"],
    exams: json["data"] == null ? [] : List<Exam>.from(json["data"]!.map((x) => Exam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": exams == null ? [] : List<dynamic>.from(exams!.map((x) => x.toJson())),
  };

  ExamsListEntity toEntity() => ExamsListEntity(
    statusCode: statusCode,
    message: message,
    exams: exams,
  );

}

class Exam {
  final int? id;
  final dynamic examSubmissionId;
  final String? title;
  final String? examType;
  final DateTime? examDate;
  final String? startTime;
  final String? endTime;
  final double? marks;
  final dynamic earnedMarks;
  final String? status;

  Exam({
    this.id,
    this.examSubmissionId,
    this.title,
    this.examType,
    this.examDate,
    this.startTime,
    this.endTime,
    this.marks,
    this.earnedMarks,
    this.status,
  });

  Exam copyWith({
    int? id,
    dynamic examSubmissionId,
    String? title,
    String? examType,
    DateTime? examDate,
    String? startTime,
    String? endTime,
    double? marks,
    dynamic earnedMarks,
    String? status,
  }) =>
      Exam(
        id: id ?? this.id,
        examSubmissionId: examSubmissionId ?? this.examSubmissionId,
        title: title ?? this.title,
        examType: examType ?? this.examType,
        examDate: examDate ?? this.examDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        marks: marks ?? this.marks,
        earnedMarks: earnedMarks ?? this.earnedMarks,
        status: status ?? this.status,
      );

  factory Exam.fromRawJson(String str) => Exam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
    id: json["id"],
    examSubmissionId: json["examSubmissionId"],
    title: json["title"],
    examType: json["examType"],
    examDate: json["examDate"] == null ? null : DateTime.parse(json["examDate"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    marks: json["marks"],
    earnedMarks: json["earnedMarks"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "examSubmissionId": examSubmissionId,
    "title": title,
    "examType": examType,
    "examDate": "${examDate!.year.toString().padLeft(4, '0')}-${examDate!.month.toString().padLeft(2, '0')}-${examDate!.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endTime": endTime,
    "marks": marks,
    "earnedMarks": earnedMarks,
    "status": status,
  };
}
