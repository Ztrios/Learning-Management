import 'dart:convert';

import 'package:learning_management/features/subject_details/domain/entities/assignment_details_entity.dart';

class AssignmentDetailsModel {
  final int? statusCode;
  final String? message;
  final AssignmentDetails? assignmentDetails;

  AssignmentDetailsModel({
    this.statusCode,
    this.message,
    this.assignmentDetails,
  });

  AssignmentDetailsModel copyWith({
    int? statusCode,
    String? message,
    AssignmentDetails? assignmentDetails,
  }) =>
      AssignmentDetailsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        assignmentDetails: assignmentDetails ?? this.assignmentDetails,
      );

  factory AssignmentDetailsModel.fromRawJson(String str) => AssignmentDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignmentDetailsModel.fromJson(Map<String, dynamic> json) => AssignmentDetailsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    assignmentDetails: json["data"] == null ? null : AssignmentDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": assignmentDetails?.toJson(),
  };

  AssignmentDetailsEntity toEntity() => AssignmentDetailsEntity(
    statusCode: statusCode,
    message: message,
    assignmentDetails: assignmentDetails
  );

}

class AssignmentDetails {
  final int? id;
  final String? title;
  final DateTime? deadline;
  final DateTime? startTime;
  final String? description;
  final int? marks;
  final int? lessonId;
  final List<String>? fileUrls;

  AssignmentDetails({
    this.id,
    this.title,
    this.deadline,
    this.startTime,
    this.description,
    this.marks,
    this.lessonId,
    this.fileUrls,
  });

  AssignmentDetails copyWith({
    int? id,
    String? title,
    DateTime? deadline,
    DateTime? startTime,
    String? description,
    int? marks,
    int? lessonId,
    List<String>? fileUrls,
  }) =>
      AssignmentDetails(
        id: id ?? this.id,
        title: title ?? this.title,
        deadline: deadline ?? this.deadline,
        startTime: startTime ?? this.startTime,
        description: description ?? this.description,
        marks: marks ?? this.marks,
        lessonId: lessonId ?? this.lessonId,
        fileUrls: fileUrls ?? this.fileUrls,
      );

  factory AssignmentDetails.fromRawJson(String str) => AssignmentDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignmentDetails.fromJson(Map<String, dynamic> json) => AssignmentDetails(
    id: json["id"],
    title: json["title"],
    deadline: json["deadline"] == null ? null : DateTime.parse(json["deadline"]),
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    description: json["description"],
    marks: json["marks"],
    lessonId: json["lessonId"],
    fileUrls: json["fileUrls"] == null ? [] : List<String>.from(json["fileUrls"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "deadline": deadline?.toIso8601String(),
    "startTime": startTime?.toIso8601String(),
    "description": description,
    "marks": marks,
    "lessonId": lessonId,
    "fileUrls": fileUrls == null ? [] : List<dynamic>.from(fileUrls!.map((x) => x)),
  };
}
