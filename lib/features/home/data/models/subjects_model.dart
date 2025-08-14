import 'dart:convert';

import 'package:learning_management/features/home/domain/entities/subject_entity.dart';

class SubjectsModel {
  final int? statusCode;
  final String? message;
  final SubjectsData? subjectsData;

  SubjectsModel({
    this.statusCode,
    this.message,
    this.subjectsData,
  });

  SubjectsModel copyWith({
    int? statusCode,
    String? message,
    SubjectsData? subjectsData,
  }) =>
      SubjectsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        subjectsData: subjectsData ?? this.subjectsData,
      );

  factory SubjectsModel.fromRawJson(String str) => SubjectsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    subjectsData: json["data"] == null ? null : SubjectsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": subjectsData?.toJson(),
  };


  SubjectsEntity toEntity()=> SubjectsEntity(
    statusCode: statusCode,
    message: message,
    subjectsData: subjectsData,
  );


}

class SubjectsData {
  final List<Content>? content;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;
  final bool? first;
  final bool? last;

  SubjectsData({
    this.content,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  SubjectsData copyWith({
    List<Content>? content,
    int? pageNumber,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
  }) =>
      SubjectsData(
        content: content ?? this.content,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
        first: first ?? this.first,
        last: last ?? this.last,
      );

  factory SubjectsData.fromRawJson(String str) => SubjectsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubjectsData.fromJson(Map<String, dynamic> json) => SubjectsData(
    content: json["content"] == null ? [] : List<Content>.from(json["content"]!.map((x) => Content.fromJson(x))),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
    first: json["first"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "content": content == null ? [] : List<dynamic>.from(content!.map((x) => x.toJson())),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "totalElements": totalElements,
    "totalPages": totalPages,
    "first": first,
    "last": last,
  };
}

class Content {
  final int? id;
  final String? code;
  final String? name;
  final String? description;
  final String? imgFileDeletePath;
  final String? imagePath;
  final int? hoursPerWeek;
  final String? status;
  final double? totalMarks;
  final Standard? standard;
  final List<String>? materialUrlDeletePath;
  final List<String>? courseMaterials;

  Content({
    this.id,
    this.code,
    this.name,
    this.description,
    this.imgFileDeletePath,
    this.imagePath,
    this.hoursPerWeek,
    this.status,
    this.totalMarks,
    this.standard,
    this.materialUrlDeletePath,
    this.courseMaterials,
  });

  Content copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? imgFileDeletePath,
    String? imagePath,
    int? hoursPerWeek,
    String? status,
    double? totalMarks,
    Standard? standard,
    List<String>? materialUrlDeletePath,
    List<String>? courseMaterials,
  }) =>
      Content(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        description: description ?? this.description,
        imgFileDeletePath: imgFileDeletePath ?? this.imgFileDeletePath,
        imagePath: imagePath ?? this.imagePath,
        hoursPerWeek: hoursPerWeek ?? this.hoursPerWeek,
        status: status ?? this.status,
        totalMarks: totalMarks ?? this.totalMarks,
        standard: standard ?? this.standard,
        materialUrlDeletePath: materialUrlDeletePath ?? this.materialUrlDeletePath,
        courseMaterials: courseMaterials ?? this.courseMaterials,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
    imgFileDeletePath: json["imgFileDeletePath"],
    imagePath: json["imagePath"],
    hoursPerWeek: json["hours_per_week"],
    status: json["status"],
    totalMarks: json["total_marks"],
    standard: json["standard"] == null ? null : Standard.fromJson(json["standard"]),
    materialUrlDeletePath: json["materialUrlDeletePath"] == null ? [] : List<String>.from(json["materialUrlDeletePath"]!.map((x) => x)),
    courseMaterials: json["course_materials"] == null ? [] : List<String>.from(json["course_materials"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "imgFileDeletePath": imgFileDeletePath,
    "imagePath": imagePath,
    "hours_per_week": hoursPerWeek,
    "status": status,
    "total_marks": totalMarks,
    "standard": standard?.toJson(),
    "materialUrlDeletePath": materialUrlDeletePath == null ? [] : List<dynamic>.from(materialUrlDeletePath!.map((x) => x)),
    "course_materials": courseMaterials == null ? [] : List<dynamic>.from(courseMaterials!.map((x) => x)),
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
