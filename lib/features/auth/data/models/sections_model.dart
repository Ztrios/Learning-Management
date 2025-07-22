import 'dart:convert';

import 'package:learning_management/features/auth/domain/entities/sections_entity.dart';

class SectionsModel {
  final int? statusCode;
  final String? message;
  final SectionsData? sectionsData;

  SectionsModel({
    this.statusCode,
    this.message,
    this.sectionsData,
  });

  SectionsModel copyWith({
    int? statusCode,
    String? message,
    SectionsData? sectionsData,
  }) =>
      SectionsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        sectionsData: sectionsData ?? this.sectionsData,
      );

  factory SectionsModel.fromRawJson(String str) => SectionsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SectionsModel.fromJson(Map<String, dynamic> json) => SectionsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    sectionsData: json["data"] == null ? null : SectionsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": sectionsData?.toJson(),
  };


  SectionsEntity toEntity()=> SectionsEntity(
    statusCode: statusCode,
    message: message,
    sectionsData: sectionsData,
  );

}

class SectionsData {
  final List<Content>? content;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;
  final bool? first;
  final bool? last;

  SectionsData({
    this.content,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  SectionsData copyWith({
    List<Content>? content,
    int? pageNumber,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
  }) =>
      SectionsData(
        content: content ?? this.content,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
        first: first ?? this.first,
        last: last ?? this.last,
      );

  factory SectionsData.fromRawJson(String str) => SectionsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SectionsData.fromJson(Map<String, dynamic> json) => SectionsData(
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
  final String? sectionName;
  final String? yearBatch;
  final int? studentCount;
  final int? maxStudent;
  final Standard? standard;

  Content({
    this.id,
    this.sectionName,
    this.yearBatch,
    this.studentCount,
    this.maxStudent,
    this.standard,
  });

  Content copyWith({
    int? id,
    String? sectionName,
    String? yearBatch,
    int? studentCount,
    int? maxStudent,
    Standard? standard,
  }) =>
      Content(
        id: id ?? this.id,
        sectionName: sectionName ?? this.sectionName,
        yearBatch: yearBatch ?? this.yearBatch,
        studentCount: studentCount ?? this.studentCount,
        maxStudent: maxStudent ?? this.maxStudent,
        standard: standard ?? this.standard,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    sectionName: json["sectionName"],
    yearBatch: json["yearBatch"],
    studentCount: json["studentCount"],
    maxStudent: json["maxStudent"],
    standard: json["standard"] == null ? null : Standard.fromJson(json["standard"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sectionName": sectionName,
    "yearBatch": yearBatch,
    "studentCount": studentCount,
    "maxStudent": maxStudent,
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
