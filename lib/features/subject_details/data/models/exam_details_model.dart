import 'dart:convert';

import 'package:learning_management/features/subject_details/domain/entities/exam_details_entity.dart';

class ExamDetailsModel {
  final int? statusCode;
  final String? message;
  final ExamDetails? examDetails;

  ExamDetailsModel({
    this.statusCode,
    this.message,
    this.examDetails,
  });

  ExamDetailsModel copyWith({
    int? statusCode,
    String? message,
    ExamDetails? examDetails,
  }) =>
      ExamDetailsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        examDetails: examDetails ?? this.examDetails,
      );

  factory ExamDetailsModel.fromRawJson(String str) => ExamDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExamDetailsModel.fromJson(Map<String, dynamic> json) => ExamDetailsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    examDetails: json["data"] == null ? null : ExamDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": examDetails?.toJson(),
  };


  ExamDetailsEntity toEntity()=> ExamDetailsEntity(
    statusCode: statusCode,
    message: message,
    examDetails: examDetails,
  );

}

class ExamDetails {
  final int? id;
  final String? title;
  final String? description;
  final int? currentStudentSubmissionId;
  final String? examType;
  final DateTime? examDate;
  final String? startTime;
  final String? endTime;
  final int? fullMarks;
  final DateTime? markingDeadline;
  final String? examStatus;
  final bool? allSubjects;
  final bool? allSections;
  final bool? questionLocked;
  final List<String>? fileUrls;
  final Standard? standard;
  final List<int>? sectionIds;
  final List<Standard>? sections;
  final List<Subject>? subjects;
  final String? yearBatch;

  ExamDetails({
    this.id,
    this.title,
    this.description,
    this.currentStudentSubmissionId,
    this.examType,
    this.examDate,
    this.startTime,
    this.endTime,
    this.fullMarks,
    this.markingDeadline,
    this.examStatus,
    this.allSubjects,
    this.allSections,
    this.questionLocked,
    this.fileUrls,
    this.standard,
    this.sectionIds,
    this.sections,
    this.subjects,
    this.yearBatch,
  });

  ExamDetails copyWith({
    int? id,
    String? title,
    String? description,
    int? currentStudentSubmissionId,
    String? examType,
    DateTime? examDate,
    String? startTime,
    String? endTime,
    int? fullMarks,
    DateTime? markingDeadline,
    String? examStatus,
    bool? allSubjects,
    bool? allSections,
    bool? questionLocked,
    List<String>? fileUrls,
    Standard? standard,
    List<int>? sectionIds,
    List<Standard>? sections,
    List<Subject>? subjects,
    String? yearBatch,
  }) =>
      ExamDetails(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        currentStudentSubmissionId: currentStudentSubmissionId ?? this.currentStudentSubmissionId,
        examType: examType ?? this.examType,
        examDate: examDate ?? this.examDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        fullMarks: fullMarks ?? this.fullMarks,
        markingDeadline: markingDeadline ?? this.markingDeadline,
        examStatus: examStatus ?? this.examStatus,
        allSubjects: allSubjects ?? this.allSubjects,
        allSections: allSections ?? this.allSections,
        questionLocked: questionLocked ?? this.questionLocked,
        fileUrls: fileUrls ?? this.fileUrls,
        standard: standard ?? this.standard,
        sectionIds: sectionIds ?? this.sectionIds,
        sections: sections ?? this.sections,
        subjects: subjects ?? this.subjects,
        yearBatch: yearBatch ?? this.yearBatch,
      );

  factory ExamDetails.fromRawJson(String str) => ExamDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExamDetails.fromJson(Map<String, dynamic> json) => ExamDetails(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    currentStudentSubmissionId: json["currentStudentSubmissionId"],
    examType: json["examType"],
    examDate: json["examDate"] == null ? null : DateTime.parse(json["examDate"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    fullMarks: json["fullMarks"],
    markingDeadline: json["markingDeadline"] == null ? null : DateTime.parse(json["markingDeadline"]),
    examStatus: json["examStatus"],
    allSubjects: json["allSubjects"],
    allSections: json["allSections"],
    questionLocked: json["questionLocked"],
    fileUrls: json["fileUrls"] == null ? [] : List<String>.from(json["fileUrls"]!.map((x) => x)),
    standard: json["standard"] == null ? null : Standard.fromJson(json["standard"]),
    sectionIds: json["sectionIds"] == null ? [] : List<int>.from(json["sectionIds"]!.map((x) => x)),
    sections: json["sections"] == null ? [] : List<Standard>.from(json["sections"]!.map((x) => Standard.fromJson(x))),
    subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
    yearBatch: json["yearBatch"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "currentStudentSubmissionId": currentStudentSubmissionId,
    "examType": examType,
    "examDate": "${examDate!.year.toString().padLeft(4, '0')}-${examDate!.month.toString().padLeft(2, '0')}-${examDate!.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endTime": endTime,
    "fullMarks": fullMarks,
    "markingDeadline": markingDeadline?.toIso8601String(),
    "examStatus": examStatus,
    "allSubjects": allSubjects,
    "allSections": allSections,
    "questionLocked": questionLocked,
    "fileUrls": fileUrls == null ? [] : List<dynamic>.from(fileUrls!.map((x) => x)),
    "standard": standard?.toJson(),
    "sectionIds": sectionIds == null ? [] : List<dynamic>.from(sectionIds!.map((x) => x)),
    "sections": sections == null ? [] : List<dynamic>.from(sections!.map((x) => x.toJson())),
    "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    "yearBatch": yearBatch,
  };
}

class Standard {
  final int? id;
  final String? name;

  Standard({
    this.id,
    this.name,
  });

  Standard copyWith({
    int? id,
    String? name,
  }) =>
      Standard(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Standard.fromRawJson(String str) => Standard.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Standard.fromJson(Map<String, dynamic> json) => Standard(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Subject {
  final int? subjectId;
  final String? subjectName;
  final String? subjectCode;
  final int? totalMarks;

  Subject({
    this.subjectId,
    this.subjectName,
    this.subjectCode,
    this.totalMarks,
  });

  Subject copyWith({
    int? subjectId,
    String? subjectName,
    String? subjectCode,
    int? totalMarks,
  }) =>
      Subject(
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        subjectCode: subjectCode ?? this.subjectCode,
        totalMarks: totalMarks ?? this.totalMarks,
      );

  factory Subject.fromRawJson(String str) => Subject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    subjectId: json["subjectId"],
    subjectName: json["subjectName"],
    subjectCode: json["subjectCode"],
    totalMarks: json["totalMarks"],
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId,
    "subjectName": subjectName,
    "subjectCode": subjectCode,
    "totalMarks": totalMarks,
  };
}
