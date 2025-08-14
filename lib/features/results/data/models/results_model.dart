import 'dart:convert';

import 'package:learning_management/features/results/domain/entities/results_entities.dart';

class ResultsModel {
  final int? statusCode;
  final String? message;
  final ResultsData? resultsData;

  ResultsModel({
    this.statusCode,
    this.message,
    this.resultsData,
  });

  ResultsModel copyWith({
    int? statusCode,
    String? message,
    ResultsData? resultsData,
  }) =>
      ResultsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        resultsData: resultsData ?? this.resultsData,
      );

  factory ResultsModel.fromRawJson(String str) => ResultsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultsModel.fromJson(Map<String, dynamic> json) => ResultsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    resultsData: json["data"] == null ? null : ResultsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": resultsData?.toJson(),
  };


  ResultsEntity toEntity()=> ResultsEntity(
    statusCode: statusCode,
    message: message,
    resultsData: resultsData,
  );

}

class ResultsData {
  final int? studentId;
  final String? studentName;
  final double? overallPercentage;
  final String? overallGrade;
  final int? sectionRank;
  final int? totalStudentsInSection;
  final int? standardRank;
  final int? totalStudentsInStandard;
  final List<SubjectPerformance>? subjectPerformances;

  ResultsData({
    this.studentId,
    this.studentName,
    this.overallPercentage,
    this.overallGrade,
    this.sectionRank,
    this.totalStudentsInSection,
    this.standardRank,
    this.totalStudentsInStandard,
    this.subjectPerformances,
  });

  ResultsData copyWith({
    int? studentId,
    String? studentName,
    double? overallPercentage,
    String? overallGrade,
    int? sectionRank,
    int? totalStudentsInSection,
    int? standardRank,
    int? totalStudentsInStandard,
    List<SubjectPerformance>? subjectPerformances,
  }) =>
      ResultsData(
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        overallPercentage: overallPercentage ?? this.overallPercentage,
        overallGrade: overallGrade ?? this.overallGrade,
        sectionRank: sectionRank ?? this.sectionRank,
        totalStudentsInSection: totalStudentsInSection ?? this.totalStudentsInSection,
        standardRank: standardRank ?? this.standardRank,
        totalStudentsInStandard: totalStudentsInStandard ?? this.totalStudentsInStandard,
        subjectPerformances: subjectPerformances ?? this.subjectPerformances,
      );

  factory ResultsData.fromRawJson(String str) => ResultsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResultsData.fromJson(Map<String, dynamic> json) => ResultsData(
    studentId: json["studentId"],
    studentName: json["studentName"],
    overallPercentage: json["overallPercentage"]?.toDouble(),
    overallGrade: json["overallGrade"],
    sectionRank: json["sectionRank"],
    totalStudentsInSection: json["totalStudentsInSection"],
    standardRank: json["standardRank"],
    totalStudentsInStandard: json["totalStudentsInStandard"],
    subjectPerformances: json["subjectPerformances"] == null ? [] : List<SubjectPerformance>.from(json["subjectPerformances"]!.map((x) => SubjectPerformance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "studentName": studentName,
    "overallPercentage": overallPercentage,
    "overallGrade": overallGrade,
    "sectionRank": sectionRank,
    "totalStudentsInSection": totalStudentsInSection,
    "standardRank": standardRank,
    "totalStudentsInStandard": totalStudentsInStandard,
    "subjectPerformances": subjectPerformances == null ? [] : List<dynamic>.from(subjectPerformances!.map((x) => x.toJson())),
  };
}

class SubjectPerformance {
  final int? studentId;
  final String? studentName;
  final int? subjectId;
  final String? subjectName;
  final int? totalQuizzes;
  final int? quizAttends;
  final double? earnedQuizMarks;
  final double? totalQuizMarks;
  final int? totalAssignments;
  final int? totalAssignmentSubmission;
  final double? earnedAssignmentMarks;
  final double? totalAssignmentMarks;
  final int? totalExams;
  final int? totalExamAttends;
  final double? earnedExamMarks;
  final double? totalExamMarks;
  final double? finalMarks;
  final double? totalPossibleMarks;
  final double? percentage;
  final int? classRank;
  final int? sectionRank;

  SubjectPerformance({
    this.studentId,
    this.studentName,
    this.subjectId,
    this.subjectName,
    this.totalQuizzes,
    this.quizAttends,
    this.earnedQuizMarks,
    this.totalQuizMarks,
    this.totalAssignments,
    this.totalAssignmentSubmission,
    this.earnedAssignmentMarks,
    this.totalAssignmentMarks,
    this.totalExams,
    this.totalExamAttends,
    this.earnedExamMarks,
    this.totalExamMarks,
    this.finalMarks,
    this.totalPossibleMarks,
    this.percentage,
    this.classRank,
    this.sectionRank,
  });

  SubjectPerformance copyWith({
    int? studentId,
    String? studentName,
    int? subjectId,
    String? subjectName,
    int? totalQuizzes,
    int? quizAttends,
    double? earnedQuizMarks,
    double? totalQuizMarks,
    int? totalAssignments,
    int? totalAssignmentSubmission,
    double? earnedAssignmentMarks,
    double? totalAssignmentMarks,
    int? totalExams,
    int? totalExamAttends,
    double? earnedExamMarks,
    double? totalExamMarks,
    double? finalMarks,
    double? totalPossibleMarks,
    double? percentage,
    int? classRank,
    int? sectionRank,
  }) =>
      SubjectPerformance(
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        totalQuizzes: totalQuizzes ?? this.totalQuizzes,
        quizAttends: quizAttends ?? this.quizAttends,
        earnedQuizMarks: earnedQuizMarks ?? this.earnedQuizMarks,
        totalQuizMarks: totalQuizMarks ?? this.totalQuizMarks,
        totalAssignments: totalAssignments ?? this.totalAssignments,
        totalAssignmentSubmission: totalAssignmentSubmission ?? this.totalAssignmentSubmission,
        earnedAssignmentMarks: earnedAssignmentMarks ?? this.earnedAssignmentMarks,
        totalAssignmentMarks: totalAssignmentMarks ?? this.totalAssignmentMarks,
        totalExams: totalExams ?? this.totalExams,
        totalExamAttends: totalExamAttends ?? this.totalExamAttends,
        earnedExamMarks: earnedExamMarks ?? this.earnedExamMarks,
        totalExamMarks: totalExamMarks ?? this.totalExamMarks,
        finalMarks: finalMarks ?? this.finalMarks,
        totalPossibleMarks: totalPossibleMarks ?? this.totalPossibleMarks,
        percentage: percentage ?? this.percentage,
        classRank: classRank ?? this.classRank,
        sectionRank: sectionRank ?? this.sectionRank,
      );

  factory SubjectPerformance.fromRawJson(String str) => SubjectPerformance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubjectPerformance.fromJson(Map<String, dynamic> json) => SubjectPerformance(
    studentId: json["studentId"],
    studentName: json["studentName"],
    subjectId: json["subjectId"],
    subjectName: json["subjectName"],
    totalQuizzes: json["totalQuizzes"],
    quizAttends: json["quizAttends"],
    earnedQuizMarks: json["earnedQuizMarks"]?.toDouble(),
    totalQuizMarks: json["totalQuizMarks"]?.toDouble(),
    totalAssignments: json["totalAssignments"],
    totalAssignmentSubmission: json["totalAssignmentSubmission"],
    earnedAssignmentMarks: json["earnedAssignmentMarks"]?.toDouble(),
    totalAssignmentMarks: json["totalAssignmentMarks"]?.toDouble(),
    totalExams: json["totalExams"],
    totalExamAttends: json["totalExamAttends"],
    earnedExamMarks: json["earnedExamMarks"]?.toDouble(),
    totalExamMarks: json["totalExamMarks"]?.toDouble(),
    finalMarks: json["finalMarks"]?.toDouble(),
    totalPossibleMarks: json["totalPossibleMarks"]?.toDouble(),
    percentage: json["percentage"]?.toDouble(),
    classRank: json["classRank"],
    sectionRank: json["sectionRank"],
  );

  Map<String, dynamic> toJson() => {
    "studentId": studentId,
    "studentName": studentName,
    "subjectId": subjectId,
    "subjectName": subjectName,
    "totalQuizzes": totalQuizzes,
    "quizAttends": quizAttends,
    "earnedQuizMarks": earnedQuizMarks,
    "totalQuizMarks": totalQuizMarks,
    "totalAssignments": totalAssignments,
    "totalAssignmentSubmission": totalAssignmentSubmission,
    "earnedAssignmentMarks": earnedAssignmentMarks,
    "totalAssignmentMarks": totalAssignmentMarks,
    "totalExams": totalExams,
    "totalExamAttends": totalExamAttends,
    "earnedExamMarks": earnedExamMarks,
    "totalExamMarks": totalExamMarks,
    "finalMarks": finalMarks,
    "totalPossibleMarks": totalPossibleMarks,
    "percentage": percentage,
    "classRank": classRank,
    "sectionRank": sectionRank,
  };
}
