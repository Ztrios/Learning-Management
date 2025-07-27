import 'dart:convert';

import 'package:learning_management/features/home/domain/entities/todays_class_entity.dart';
import 'package:learning_management/features/routine/domain/entities/class_routine_entities.dart';

class ClassRoutineModel {
  final int? statusCode;
  final String? message;
  final ClassData? classData;

  ClassRoutineModel({
    this.statusCode,
    this.message,
    this.classData
  });

  ClassRoutineModel copyWith({
    int? statusCode,
    String? message,
    ClassData? classData,
  }) =>
      ClassRoutineModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        classData: classData ?? this.classData,
      );

  factory ClassRoutineModel.fromRawJson(String str) => ClassRoutineModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassRoutineModel.fromJson(Map<String, dynamic> json) => ClassRoutineModel(
    statusCode: json["statusCode"],
    message: json["message"],
    classData: json["data"] == null ? null : ClassData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": classData?.toJson(),
  };


  ClassRoutineEntity toEntity()=> ClassRoutineEntity(
    statusCode: statusCode,
    message: message,
    classData: classData,
  );

}

class ClassData {
  final int? id;
  final Section? section;
  final String? dayOfWeek;
  final String? startTime;
  final String? endTime;
  final List<ClassSchedule>? classSchedule;
  final String? meetingId;
  final String? meetingLink;
  final String? meetingPass;

  ClassData({
    this.id,
    this.section,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
    this.classSchedule,
    this.meetingId,
    this.meetingLink,
    this.meetingPass,
  });

  ClassData copyWith({
    int? id,
    Section? section,
    String? dayOfWeek,
    String? startTime,
    String? endTime,
    List<ClassSchedule>? classSchedule,
    String? meetingId,
    String? meetingLink,
    String? meetingPass,
  }) =>
      ClassData(
        id: id ?? this.id,
        section: section ?? this.section,
        dayOfWeek: dayOfWeek ?? this.dayOfWeek,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        classSchedule: classSchedule ?? this.classSchedule,
        meetingId: meetingId ?? this.meetingId,
        meetingLink: meetingLink ?? this.meetingLink,
        meetingPass: meetingPass ?? this.meetingPass,
      );

  factory ClassData.fromRawJson(String str) => ClassData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassData.fromJson(Map<String, dynamic> json) => ClassData(
    id: json["id"],
    section: json["section"] == null ? null : Section.fromJson(json["section"]),
    dayOfWeek: json["dayOfWeek"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    classSchedule: json["classSchedule"] == null ? [] : List<ClassSchedule>.from(json["classSchedule"]!.map((x) => ClassSchedule.fromJson(x))),
    meetingId: json["meetingId"],
    meetingLink: json["meetingLink"],
    meetingPass: json["meetingPass"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "section": section?.toJson(),
    "dayOfWeek": dayOfWeek,
    "startTime": startTime,
    "endTime": endTime,
    "classSchedule": classSchedule == null ? [] : List<dynamic>.from(classSchedule!.map((x) => x.toJson())),
    "meetingId": meetingId,
    "meetingLink": meetingLink,
    "meetingPass": meetingPass,
  };
}

class ClassSchedule {
  final ClassInfo? classInfo;
  final String? startTime;
  final String? endTime;

  ClassSchedule({
    this.classInfo,
    this.startTime,
    this.endTime,
  });

  ClassSchedule copyWith({
    ClassInfo? classInfo,
    String? startTime,
    String? endTime,
  }) =>
      ClassSchedule(
        classInfo: classInfo ?? this.classInfo,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory ClassSchedule.fromRawJson(String str) => ClassSchedule.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassSchedule.fromJson(Map<String, dynamic> json) => ClassSchedule(
    classInfo: json["classInfo"] == null ? null : ClassInfo.fromJson(json["classInfo"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
  );

  Map<String, dynamic> toJson() => {
    "classInfo": classInfo?.toJson(),
    "startTime": startTime,
    "endTime": endTime,
  };
}

class ClassInfo {
  final int? id;
  final String? className;
  final String? subject;
  final String? instructor;
  final int? instructorId;

  ClassInfo({
    this.id,
    this.className,
    this.subject,
    this.instructor,
    this.instructorId,
  });

  ClassInfo copyWith({
    int? id,
    String? className,
    String? subject,
    String? instructor,
    int? instructorId,
  }) =>
      ClassInfo(
        id: id ?? this.id,
        className: className ?? this.className,
        subject: subject ?? this.subject,
        instructor: instructor ?? this.instructor,
        instructorId: instructorId ?? this.instructorId,
      );

  factory ClassInfo.fromRawJson(String str) => ClassInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassInfo.fromJson(Map<String, dynamic> json) => ClassInfo(
    id: json["id"],
    className: json["className"],
    subject: json["subject"],
    instructor: json["instructor"],
    instructorId: json["instructorId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "className": className,
    "subject": subject,
    "instructor": instructor,
    "instructorId": instructorId,
  };
}

class Section {
  final int? id;
  final String? name;

  Section({
    this.id,
    this.name,
  });

  Section copyWith({
    int? id,
    String? name,
  }) =>
      Section(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
