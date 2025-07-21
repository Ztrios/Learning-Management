import 'dart:convert';

import 'package:learning_management/features/authentication/data/models/student_model.dart';
import 'package:learning_management/features/authentication/domain/entities/sections_entity.dart';

class SectionsModel {
  final int? id;
  final String? sectionName;
  final String? yearBatch;
  final Standard? standard;

  SectionsModel({
    this.id,
    this.sectionName,
    this.yearBatch,
    this.standard,
  });

  SectionsModel copyWith({
    int? id,
    String? sectionName,
    String? yearBatch,
    Standard? standard,
  }) =>
      SectionsModel(
        id: id ?? this.id,
        sectionName: sectionName ?? this.sectionName,
        yearBatch: yearBatch ?? this.yearBatch,
        standard: standard ?? this.standard,
      );

  factory SectionsModel.fromRawJson(String str) => SectionsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SectionsModel.fromJson(Map<String, dynamic> json) => SectionsModel(
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

  SectionsEntity toEntity()=> SectionsEntity();


}