import 'dart:convert';

import 'package:learning_management/features/home/domain/entities/announcements_entity.dart';

class AnnouncementsModel {
  final int? statusCode;
  final String? message;
  final AnnouncementsData? announcementsData;

  AnnouncementsModel({
    this.statusCode,
    this.message,
    this.announcementsData,
  });

  AnnouncementsModel copyWith({
    int? statusCode,
    String? message,
    AnnouncementsData? announcementsData,
  }) =>
      AnnouncementsModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        announcementsData: announcementsData ?? this.announcementsData,
      );

  factory AnnouncementsModel.fromRawJson(String str) => AnnouncementsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnnouncementsModel.fromJson(Map<String, dynamic> json) => AnnouncementsModel(
    statusCode: json["statusCode"],
    message: json["message"],
    announcementsData: json["data"] == null ? null : AnnouncementsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": announcementsData?.toJson(),
  };

  AnnouncementsEntity toEntity()=> AnnouncementsEntity(
    statusCode: statusCode,
    message: message ,
    announcementsData: announcementsData,
  );

}

class AnnouncementsData {
  final List<Content>? content;
  final int? pageNumber;
  final int? pageSize;
  final int? totalElements;
  final int? totalPages;
  final bool? first;
  final bool? last;

  AnnouncementsData({
    this.content,
    this.pageNumber,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.first,
    this.last,
  });

  AnnouncementsData copyWith({
    List<Content>? content,
    int? pageNumber,
    int? pageSize,
    int? totalElements,
    int? totalPages,
    bool? first,
    bool? last,
  }) =>
      AnnouncementsData(
        content: content ?? this.content,
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        totalElements: totalElements ?? this.totalElements,
        totalPages: totalPages ?? this.totalPages,
        first: first ?? this.first,
        last: last ?? this.last,
      );

  factory AnnouncementsData.fromRawJson(String str) => AnnouncementsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnnouncementsData.fromJson(Map<String, dynamic> json) => AnnouncementsData(
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
  final String? title;
  final String? content;
  final String? announcementFor;
  final String? filePath;
  final String? fileType;
  final List<String>? notificationOptions;

  Content({
    this.id,
    this.title,
    this.content,
    this.announcementFor,
    this.filePath,
    this.fileType,
    this.notificationOptions,
  });

  Content copyWith({
    int? id,
    String? title,
    String? content,
    String? announcementFor,
    String? filePath,
    String? fileType,
    List<String>? notificationOptions,
  }) =>
      Content(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        announcementFor: announcementFor ?? this.announcementFor,
        filePath: filePath ?? this.filePath,
        fileType: fileType ?? this.fileType,
        notificationOptions: notificationOptions ?? this.notificationOptions,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    announcementFor: json["announcementFor"],
    filePath: json["filePath"],
    fileType: json["fileType"],
    notificationOptions: json["notificationOptions"] == null ? [] : List<String>.from(json["notificationOptions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "announcementFor": announcementFor,
    "filePath": filePath,
    "fileType": fileType,
    "notificationOptions": notificationOptions == null ? [] : List<dynamic>.from(notificationOptions!.map((x) => x)),
  };
}
