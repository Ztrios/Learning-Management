import 'dart:convert';

import 'package:learning_management/features/progress/domain/entities/progress_entities.dart';

class ProgressModel {
  final int? statusCode;
  final String? message;
  final List<SubjectProgress>? subjectProgresses;

  ProgressModel({
    this.statusCode,
    this.message,
    this.subjectProgresses,
  });

  ProgressModel copyWith({
    int? statusCode,
    String? message,
    List<SubjectProgress>? subjectProgresses,
  }) =>
      ProgressModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        subjectProgresses: subjectProgresses ?? this.subjectProgresses,
      );

  factory ProgressModel.fromRawJson(String str) => ProgressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProgressModel.fromJson(Map<String, dynamic> json) => ProgressModel(
    statusCode: json["statusCode"],
    message: json["message"],
    subjectProgresses: json["data"] == null ? [] : List<SubjectProgress>.from(json["data"]!.map((x) => SubjectProgress.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": subjectProgresses == null ? [] : List<dynamic>.from(subjectProgresses!.map((x) => x.toJson())),
  };


  ProgressEntity toEntity()=> ProgressEntity(
    statusCode: statusCode,
    message: message,
    subjectProgresses: subjectProgresses,
  );


}

class SubjectProgress {
  final int? subjectId;
  final String? subjectName;
  final String? subjectCode;
  final int? totalQuizzes;
  final int? quizAttends;
  final int? quizPercentage;
  final int? totalAssignments;
  final int? totalAssignmentSubmission;
  final int? assignmentPercentage;
  final int? totalExams;
  final int? totalExamAttends;
  final int? examPercentage;

  SubjectProgress({
    this.subjectId,
    this.subjectName,
    this.subjectCode,
    this.totalQuizzes,
    this.quizAttends,
    this.quizPercentage,
    this.totalAssignments,
    this.totalAssignmentSubmission,
    this.assignmentPercentage,
    this.totalExams,
    this.totalExamAttends,
    this.examPercentage,
  });

  SubjectProgress copyWith({
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    int? totalQuizzes,
    int? quizAttends,
    int? quizPercentage,
    int? totalAssignments,
    int? totalAssignmentSubmission,
    int? assignmentPercentage,
    int? totalExams,
    int? totalExamAttends,
    int? examPercentage,
  }) =>
      SubjectProgress(
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        subjectCode: subjectCode ?? this.subjectCode,
        totalQuizzes: totalQuizzes ?? this.totalQuizzes,
        quizAttends: quizAttends ?? this.quizAttends,
        quizPercentage: quizPercentage ?? this.quizPercentage,
        totalAssignments: totalAssignments ?? this.totalAssignments,
        totalAssignmentSubmission: totalAssignmentSubmission ?? this.totalAssignmentSubmission,
        assignmentPercentage: assignmentPercentage ?? this.assignmentPercentage,
        totalExams: totalExams ?? this.totalExams,
        totalExamAttends: totalExamAttends ?? this.totalExamAttends,
        examPercentage: examPercentage ?? this.examPercentage,
      );

  factory SubjectProgress.fromRawJson(String str) => SubjectProgress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubjectProgress.fromJson(Map<String, dynamic> json) => SubjectProgress(
    subjectId: json["subjectId"],
    subjectName: json["subjectName"],
    subjectCode: json["subjectCode"],
    totalQuizzes: json["totalQuizzes"],
    quizAttends: json["quizAttends"],
    quizPercentage: json["quizPercentage"],
    totalAssignments: json["totalAssignments"],
    totalAssignmentSubmission: json["totalAssignmentSubmission"],
    assignmentPercentage: json["assignmentPercentage"],
    totalExams: json["totalExams"],
    totalExamAttends: json["totalExamAttends"],
    examPercentage: json["examPercentage"],
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "subjectName": subjectName,
    "subjectCode": subjectCode,
    "totalQuizzes": totalQuizzes,
    "quizAttends": quizAttends,
    "quizPercentage": quizPercentage,
    "totalAssignments": totalAssignments,
    "totalAssignmentSubmission": totalAssignmentSubmission,
    "assignmentPercentage": assignmentPercentage,
    "totalExams": totalExams,
    "totalExamAttends": totalExamAttends,
    "examPercentage": examPercentage,
  };
}
