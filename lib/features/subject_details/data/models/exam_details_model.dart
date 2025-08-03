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

  ExamDetailsEntity toEntity() => ExamDetailsEntity(
    message: message,
    statusCode: statusCode,
    examDetails: examDetails
  );

}

class ExamDetails {
  final int? id;
  final String? title;
  final String? description;
  final String? examType;
  final DateTime? examDate;
  final String? startTime;
  final String? endTime;
  final double? marks;
  final List<dynamic>? fileDeletePaths;
  final List<String>? fileUrls;
  final Section? section;
  final Subject? subject;

  ExamDetails({
    this.id,
    this.title,
    this.description,
    this.examType,
    this.examDate,
    this.startTime,
    this.endTime,
    this.marks,
    this.fileDeletePaths,
    this.fileUrls,
    this.section,
    this.subject,
  });

  ExamDetails copyWith({
    int? id,
    String? title,
    String? description,
    String? examType,
    DateTime? examDate,
    String? startTime,
    String? endTime,
    double? marks,
    List<dynamic>? fileDeletePaths,
    List<String>? fileUrls,
    Section? section,
    Subject? subject,
  }) =>
      ExamDetails(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        examType: examType ?? this.examType,
        examDate: examDate ?? this.examDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        marks: marks ?? this.marks,
        fileDeletePaths: fileDeletePaths ?? this.fileDeletePaths,
        fileUrls: fileUrls ?? this.fileUrls,
        section: section ?? this.section,
        subject: subject ?? this.subject,
      );

  factory ExamDetails.fromRawJson(String str) => ExamDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExamDetails.fromJson(Map<String, dynamic> json) => ExamDetails(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    examType: json["examType"],
    examDate: json["examDate"] == null ? null : DateTime.parse(json["examDate"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    marks: json["marks"],
    fileDeletePaths: json["fileDeletePaths"] == null ? [] : List<dynamic>.from(json["fileDeletePaths"]!.map((x) => x)),
    fileUrls: json["fileUrls"] == null ? [] : List<String>.from(json["fileUrls"]!.map((x) => x)),
    section: json["section"] == null ? null : Section.fromJson(json["section"]),
    subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "examType": examType,
    "examDate": "${examDate!.year.toString().padLeft(4, '0')}-${examDate!.month.toString().padLeft(2, '0')}-${examDate!.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endTime": endTime,
    "marks": marks,
    "fileDeletePaths": fileDeletePaths == null ? [] : List<dynamic>.from(fileDeletePaths!.map((x) => x)),
    "fileUrls": fileUrls == null ? [] : List<dynamic>.from(fileUrls!.map((x) => x)),
    "section": section?.toJson(),
    "subject": subject?.toJson(),
  };
}

class Section {
  final int? id;
  final String? sectionName;
  final String? yearBatch;
  final Standard? standard;

  Section({
    this.id,
    this.sectionName,
    this.yearBatch,
    this.standard,
  });

  Section copyWith({
    int? id,
    String? sectionName,
    String? yearBatch,
    Standard? standard,
  }) =>
      Section(
        id: id ?? this.id,
        sectionName: sectionName ?? this.sectionName,
        yearBatch: yearBatch ?? this.yearBatch,
        standard: standard ?? this.standard,
      );

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    sectionName: json["sectionName"],
    yearBatch: json["yearBatch"],
    standard: json["standard"] == null ? null : Standard.fromJson(json["standard"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sectionName": sectionName,
    "yearBatch": yearBatch,
    "standard": standard?.toJson(),
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
  final int? id;
  final String? code;
  final String? name;
  final dynamic imagePath;

  Subject({
    this.id,
    this.code,
    this.name,
    this.imagePath,
  });

  Subject copyWith({
    int? id,
    String? code,
    String? name,
    dynamic imagePath,
  }) =>
      Subject(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
      );

  factory Subject.fromRawJson(String str) => Subject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "imagePath": imagePath,
  };
}
