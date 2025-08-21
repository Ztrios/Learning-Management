import 'dart:convert';

import 'package:learning_management/features/auth/domain/entities/standards_entity.dart';

class StandardsModel {
  final int? statusCode;
  final String? message;
  final StandardsData? standardsData;

  StandardsModel({
    this.statusCode,
    this.message,
    this.standardsData,
  });

  StandardsModel copyWith({
    int? statusCode,
    String? message,
    StandardsData? standardsData,
  }) =>
      StandardsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        standardsData: standardsData ?? this.standardsData,
      );

  factory StandardsModel.fromRawJson(String str) => StandardsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandardsModel.fromJson(Map<String, dynamic> json) => StandardsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    standardsData: json["data"] == null ? null : StandardsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": standardsData?.toJson(),
  };


  StandardsEntity toEntity()=> StandardsEntity(
    statusCode: statusCode,
    message: message,
    standardsData: standardsData,
  );

}

class StandardsData {
  final List<Content>? content;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;
  final bool? first;
  final bool? last;

  StandardsData({
    this.content,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  StandardsData copyWith({
    List<Content>? content,
    int? pageNumber,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
  }) =>
      StandardsData(
        content: content ?? this.content,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
        first: first ?? this.first,
        last: last ?? this.last,
      );

  factory StandardsData.fromRawJson(String str) => StandardsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandardsData.fromJson(Map<String, dynamic> json) => StandardsData(
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
  final String? name;
  final String? description;
  final List<Section>? section;

  Content({
    this.id,
    this.name,
    this.description,
    this.section,
  });

  Content copyWith({
    int? id,
    String? name,
    String? description,
    List<Section>? section,
  }) =>
      Content(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        section: section ?? this.section,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    section: json["section"] == null ? [] : List<Section>.from(json["section"]!.map((x) => Section.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "section": section == null ? [] : List<dynamic>.from(section!.map((x) => x.toJson())),
  };
}

class Section {
  final int? id;
  final String? sectionName;
  final String? yearBatch;

  Section({
    this.id,
    this.sectionName,
    this.yearBatch,
  });

  Section copyWith({
    int? id,
    String? sectionName,
    String? yearBatch,
  }) =>
      Section(
        id: id ?? this.id,
        sectionName: sectionName ?? this.sectionName,
        yearBatch: yearBatch ?? this.yearBatch,
      );

  factory Section.fromRawJson(String str) => Section.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    sectionName: json["sectionName"],
    yearBatch: json["yearBatch"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sectionName": sectionName,
    "yearBatch": yearBatch,
  };
}
