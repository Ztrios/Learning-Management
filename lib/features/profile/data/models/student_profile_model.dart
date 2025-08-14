import 'dart:convert';

import 'package:learning_management/features/profile/domain/entities/student_profile_entity.dart';

class StudentProfileModel {
  final int? statusCode;
  final String? message;
  final Profile? profile;

  StudentProfileModel({
    this.statusCode,
    this.message,
    this.profile,
  });

  StudentProfileModel copyWith({
    int? statusCode,
    String? message,
    Profile? profile,
  }) =>
      StudentProfileModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        profile: profile ?? this.profile,
      );

  factory StudentProfileModel.fromRawJson(String str) => StudentProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) => StudentProfileModel(
    statusCode: json["statusCode"],
    message: json["message"],
    profile: json["data"] == null ? null : Profile.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": profile?.toJson(),
  };


  StudentProfileEntity toEntity()=> StudentProfileEntity(
    statusCode: statusCode,
    message: message,
    profile: profile,
  );

}

class Profile {
  final int? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? phone;
  final String? imageDeletePath;
  final String? imagePath;
  final dynamic gender;
  final String? address;
  final String? rollNumber;
  final String? fathersName;
  final String? mothersName;
  final dynamic emergencyContact;
  final dynamic remarks;
  final dynamic deviceId;
  final dynamic deviceExpTime;
  final dynamic prevClassGrade;
  final Section? section;
  final dynamic enrollmentDate;
  final bool? isRegistrationDone;
  final dynamic subscriptionExpiry;
  final bool? enable;

  Profile({
    this.id,
    this.username,
    this.email,
    this.fullName,
    this.phone,
    this.imageDeletePath,
    this.imagePath,
    this.gender,
    this.address,
    this.rollNumber,
    this.fathersName,
    this.mothersName,
    this.emergencyContact,
    this.remarks,
    this.deviceId,
    this.deviceExpTime,
    this.prevClassGrade,
    this.section,
    this.enrollmentDate,
    this.isRegistrationDone,
    this.subscriptionExpiry,
    this.enable,
  });

  Profile copyWith({
    int? id,
    String? username,
    String? email,
    String? fullName,
    String? phone,
    String? imageDeletePath,
    String? imagePath,
    dynamic gender,
    String? address,
    String? rollNumber,
    String? fathersName,
    String? mothersName,
    dynamic emergencyContact,
    dynamic remarks,
    dynamic deviceId,
    dynamic deviceExpTime,
    dynamic prevClassGrade,
    Section? section,
    dynamic enrollmentDate,
    bool? isRegistrationDone,
    dynamic subscriptionExpiry,
    bool? enable,
  }) =>
      Profile(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        imageDeletePath: imageDeletePath ?? this.imageDeletePath,
        imagePath: imagePath ?? this.imagePath,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        rollNumber: rollNumber ?? this.rollNumber,
        fathersName: fathersName ?? this.fathersName,
        mothersName: mothersName ?? this.mothersName,
        emergencyContact: emergencyContact ?? this.emergencyContact,
        remarks: remarks ?? this.remarks,
        deviceId: deviceId ?? this.deviceId,
        deviceExpTime: deviceExpTime ?? this.deviceExpTime,
        prevClassGrade: prevClassGrade ?? this.prevClassGrade,
        section: section ?? this.section,
        enrollmentDate: enrollmentDate ?? this.enrollmentDate,
        isRegistrationDone: isRegistrationDone ?? this.isRegistrationDone,
        subscriptionExpiry: subscriptionExpiry ?? this.subscriptionExpiry,
        enable: enable ?? this.enable,
      );

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    fullName: json["fullName"],
    phone: json["phone"],
    imageDeletePath: json["imageDeletePath"],
    imagePath: json["imagePath"],
    gender: json["gender"],
    address: json["address"],
    rollNumber: json["rollNumber"],
    fathersName: json["fathersName"],
    mothersName: json["mothersName"],
    emergencyContact: json["emergencyContact"],
    remarks: json["remarks"],
    deviceId: json["deviceId"],
    deviceExpTime: json["deviceExpTime"],
    prevClassGrade: json["prevClassGrade"],
    section: json["section"] == null ? null : Section.fromJson(json["section"]),
    enrollmentDate: json["enrollmentDate"],
    isRegistrationDone: json["isRegistrationDone"],
    subscriptionExpiry: json["subscriptionExpiry"],
    enable: json["enable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "fullName": fullName,
    "phone": phone,
    "imageDeletePath": imageDeletePath,
    "imagePath": imagePath,
    "gender": gender,
    "address": address,
    "rollNumber": rollNumber,
    "fathersName": fathersName,
    "mothersName": mothersName,
    "emergencyContact": emergencyContact,
    "remarks": remarks,
    "deviceId": deviceId,
    "deviceExpTime": deviceExpTime,
    "prevClassGrade": prevClassGrade,
    "section": section?.toJson(),
    "enrollmentDate": enrollmentDate,
    "isRegistrationDone": isRegistrationDone,
    "subscriptionExpiry": subscriptionExpiry,
    "enable": enable,
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
