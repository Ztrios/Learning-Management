import 'dart:convert';

import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';

class SignInModel {
  final int? statusCode;
  final String? message;
  final SignInData? signInData;

  SignInModel({
    this.statusCode,
    this.message,
    this.signInData,
  });

  SignInModel copyWith({
    int? statusCode,
    String? message,
    SignInData? signInData,
  }) =>
      SignInModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        signInData: signInData ?? this.signInData,
      );

  factory SignInModel.fromRawJson(String str) => SignInModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    statusCode: json["statusCode"],
    message: json["message"],
    signInData: json["data"] == null ? null : SignInData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": signInData?.toJson(),
  };


  SignInEntity toEntity()=> SignInEntity(
    statusCode: statusCode,
    message: message,
    signInData: signInData,
  );


}

class SignInData {
  final String? token;
  final String? refreshToken;
  final String? username;
  final String? email;
  final String? fullName;
  final dynamic phone;
  final dynamic imagePath;
  final String? gender;
  final dynamic address;
  final dynamic rollNumber;
  final List<String>? roles;
  final int? id;
  final dynamic sectionId;
  final dynamic standardId;
  final Student? student;
  final dynamic instructor;

  SignInData({
    this.token,
    this.refreshToken,
    this.username,
    this.email,
    this.fullName,
    this.phone,
    this.imagePath,
    this.gender,
    this.address,
    this.rollNumber,
    this.roles,
    this.id,
    this.sectionId,
    this.standardId,
    this.student,
    this.instructor,
  });

  SignInData copyWith({
    String? token,
    String? refreshToken,
    String? username,
    String? email,
    String? fullName,
    dynamic phone,
    dynamic imagePath,
    String? gender,
    dynamic address,
    dynamic rollNumber,
    List<String>? roles,
    int? id,
    dynamic sectionId,
    dynamic standardId,
    Student? student,
    dynamic instructor,
  }) =>
      SignInData(
        token: token ?? this.token,
        refreshToken: refreshToken ?? this.refreshToken,
        username: username ?? this.username,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        imagePath: imagePath ?? this.imagePath,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        rollNumber: rollNumber ?? this.rollNumber,
        roles: roles ?? this.roles,
        id: id ?? this.id,
        sectionId: sectionId ?? this.sectionId,
        standardId: standardId ?? this.standardId,
        student: student ?? this.student,
        instructor: instructor ?? this.instructor,
      );

  factory SignInData.fromRawJson(String str) => SignInData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInData.fromJson(Map<String, dynamic> json) => SignInData(
    token: json["token"],
    refreshToken: json["refreshToken"],
    username: json["username"],
    email: json["email"],
    fullName: json["fullName"],
    phone: json["phone"],
    imagePath: json["imagePath"],
    gender: json["gender"],
    address: json["address"],
    rollNumber: json["rollNumber"],
    roles: json["roles"] == null ? [] : List<String>.from(json["roles"]!.map((x) => x)),
    id: json["id"],
    sectionId: json["sectionId"],
    standardId: json["standardId"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    instructor: json["instructor"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refreshToken": refreshToken,
    "username": username,
    "email": email,
    "fullName": fullName,
    "phone": phone,
    "imagePath": imagePath,
    "gender": gender,
    "address": address,
    "rollNumber": rollNumber,
    "roles": roles == null ? [] : List<dynamic>.from(roles!.map((x) => x)),
    "id": id,
    "sectionId": sectionId,
    "standardId": standardId,
    "student": student?.toJson(),
    "instructor": instructor,
  };
}

class Student {
  final int? id;
  final String? username;
  final String? email;
  final String? fullName;
  final String? phone;
  final String? imageDeletePath;
  final String? imagePath;
  final String? gender;
  final String? address;
  final String? rollNumber;
  final String? fathersName;
  final String? mothersName;
  final String? emergencyContact;
  final String? remarks;
  final String? deviceId;
  final DateTime? deviceExpTime;
  final String? prevClassGrade;
  final Section? section;
  final DateTime? enrollmentDate;
  final bool? isRegistrationDone;
  final DateTime? subscriptionExpiry;

  Student({
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
  });

  Student copyWith({
    int? id,
    String? username,
    String? email,
    String? fullName,
    String? phone,
    String? imageDeletePath,
    String? imagePath,
    String? gender,
    String? address,
    String? rollNumber,
    String? fathersName,
    String? mothersName,
    String? emergencyContact,
    String? remarks,
    String? deviceId,
    DateTime? deviceExpTime,
    String? prevClassGrade,
    Section? section,
    DateTime? enrollmentDate,
    bool? isRegistrationDone,
    DateTime? subscriptionExpiry,
  }) =>
      Student(
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
      );

  factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
    deviceExpTime: json["deviceExpTime"] == null ? null : DateTime.parse(json["deviceExpTime"]),
    prevClassGrade: json["prevClassGrade"],
    section: json["section"] == null ? null : Section.fromJson(json["section"]),
    enrollmentDate: json["enrollmentDate"] == null ? null : DateTime.parse(json["enrollmentDate"]),
    isRegistrationDone: json["isRegistrationDone"],
    subscriptionExpiry: json["subscriptionExpiry"] == null ? null : DateTime.parse(json["subscriptionExpiry"]),
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
    "deviceExpTime": "${deviceExpTime!.year.toString().padLeft(4, '0')}-${deviceExpTime!.month.toString().padLeft(2, '0')}-${deviceExpTime!.day.toString().padLeft(2, '0')}",
    "prevClassGrade": prevClassGrade,
    "section": section?.toJson(),
    "enrollmentDate": "${enrollmentDate!.year.toString().padLeft(4, '0')}-${enrollmentDate!.month.toString().padLeft(2, '0')}-${enrollmentDate!.day.toString().padLeft(2, '0')}",
    "isRegistrationDone": isRegistrationDone,
    "subscriptionExpiry": subscriptionExpiry?.toIso8601String(),
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
