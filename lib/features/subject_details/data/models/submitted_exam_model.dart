import 'dart:convert';

import 'package:learning_management/features/subject_details/domain/entities/submitted_exam_entity.dart';

class SubmittedExamModel {
  final int? statusCode;
  final String? message;
  final SubmittedExamData? submittedExamData;

  SubmittedExamModel({
    this.statusCode,
    this.message,
    this.submittedExamData,
  });

  SubmittedExamModel copyWith({
    int? statusCode,
    String? message,
    SubmittedExamData? submittedExamData,
  }) =>
      SubmittedExamModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        submittedExamData: submittedExamData ?? this.submittedExamData,
      );

  factory SubmittedExamModel.fromRawJson(String str) => SubmittedExamModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubmittedExamModel.fromJson(Map<String, dynamic> json) => SubmittedExamModel(
    statusCode: json["statusCode"],
    message: json["message"],
    submittedExamData: json["data"] == null ? null : SubmittedExamData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": submittedExamData?.toJson(),
  };

  SubmittedExamEntity toEntity()=> SubmittedExamEntity(
    statusCode: statusCode,
    message: message,
    submittedExamData: submittedExamData,
  );

}

class SubmittedExamData {
  final int? id;
  final int? examId;
  final String? examTitle;
  final DateTime? examDateTime;
  final int? studentId;
  final String? studentName;
  final String? rollNumber;
  final String? phone;
  final DateTime? submittedAt;
  final int? obtainedTotalMarks;
  final String? submissionStatus;
  final String? overallFeedback;
  final int? positionStandard;
  final int? positionSection;
  final String? lateSubmittedTime;
  final List<String>? toDeleteUrl;
  final List<String>? fileUrls;
  final List<Answer>? answers;

  SubmittedExamData({
    this.id,
    this.examId,
    this.examTitle,
    this.examDateTime,
    this.studentId,
    this.studentName,
    this.rollNumber,
    this.phone,
    this.submittedAt,
    this.obtainedTotalMarks,
    this.submissionStatus,
    this.overallFeedback,
    this.positionStandard,
    this.positionSection,
    this.lateSubmittedTime,
    this.toDeleteUrl,
    this.fileUrls,
    this.answers,
  });

  SubmittedExamData copyWith({
    int? id,
    int? examId,
    String? examTitle,
    DateTime? examDateTime,
    int? studentId,
    String? studentName,
    String? rollNumber,
    String? phone,
    DateTime? submittedAt,
    int? obtainedTotalMarks,
    String? submissionStatus,
    String? overallFeedback,
    int? positionStandard,
    int? positionSection,
    String? lateSubmittedTime,
    List<String>? toDeleteUrl,
    List<String>? fileUrls,
    List<Answer>? answers,
  }) =>
      SubmittedExamData(
        id: id ?? this.id,
        examId: examId ?? this.examId,
        examTitle: examTitle ?? this.examTitle,
        examDateTime: examDateTime ?? this.examDateTime,
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        rollNumber: rollNumber ?? this.rollNumber,
        phone: phone ?? this.phone,
        submittedAt: submittedAt ?? this.submittedAt,
        obtainedTotalMarks: obtainedTotalMarks ?? this.obtainedTotalMarks,
        submissionStatus: submissionStatus ?? this.submissionStatus,
        overallFeedback: overallFeedback ?? this.overallFeedback,
        positionStandard: positionStandard ?? this.positionStandard,
        positionSection: positionSection ?? this.positionSection,
        lateSubmittedTime: lateSubmittedTime ?? this.lateSubmittedTime,
        toDeleteUrl: toDeleteUrl ?? this.toDeleteUrl,
        fileUrls: fileUrls ?? this.fileUrls,
        answers: answers ?? this.answers,
      );

  factory SubmittedExamData.fromRawJson(String str) => SubmittedExamData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubmittedExamData.fromJson(Map<String, dynamic> json) => SubmittedExamData(
    id: json["id"],
    examId: json["examId"],
    examTitle: json["examTitle"],
    examDateTime: json["examDateTime"] == null ? null : DateTime.parse(json["examDateTime"]),
    studentId: json["studentId"],
    studentName: json["studentName"],
    rollNumber: json["rollNumber"],
    phone: json["phone"],
    submittedAt: json["submittedAt"] == null ? null : DateTime.parse(json["submittedAt"]),
    obtainedTotalMarks: json["obtainedTotalMarks"],
    submissionStatus: json["submissionStatus"],
    overallFeedback: json["overallFeedback"],
    positionStandard: json["positionStandard"],
    positionSection: json["positionSection"],
    lateSubmittedTime: json["lateSubmittedTime"],
    toDeleteUrl: json["toDeleteUrl"] == null ? [] : List<String>.from(json["toDeleteUrl"]!.map((x) => x)),
    fileUrls: json["fileUrls"] == null ? [] : List<String>.from(json["fileUrls"]!.map((x) => x)),
    answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "examId": examId,
    "examTitle": examTitle,
    "examDateTime": examDateTime?.toIso8601String(),
    "studentId": studentId,
    "studentName": studentName,
    "rollNumber": rollNumber,
    "phone": phone,
    "submittedAt": submittedAt?.toIso8601String(),
    "obtainedTotalMarks": obtainedTotalMarks,
    "submissionStatus": submissionStatus,
    "overallFeedback": overallFeedback,
    "positionStandard": positionStandard,
    "positionSection": positionSection,
    "lateSubmittedTime": lateSubmittedTime,
    "toDeleteUrl": toDeleteUrl == null ? [] : List<dynamic>.from(toDeleteUrl!.map((x) => x)),
    "fileUrls": fileUrls == null ? [] : List<dynamic>.from(fileUrls!.map((x) => x)),
    "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
  };
}

class Answer {
  final int? id;
  final int? examSubjectId;
  final String? examSubjectName;
  final String? examSubjectCode;
  final String? answerText;
  final int? fullMarks;
  final int? obtainedMarks;
  final String? feedback;

  Answer({
    this.id,
    this.examSubjectId,
    this.examSubjectName,
    this.examSubjectCode,
    this.answerText,
    this.fullMarks,
    this.obtainedMarks,
    this.feedback,
  });

  Answer copyWith({
    int? id,
    int? examSubjectId,
    String? examSubjectName,
    String? examSubjectCode,
    String? answerText,
    int? fullMarks,
    int? obtainedMarks,
    String? feedback,
  }) =>
      Answer(
        id: id ?? this.id,
        examSubjectId: examSubjectId ?? this.examSubjectId,
        examSubjectName: examSubjectName ?? this.examSubjectName,
        examSubjectCode: examSubjectCode ?? this.examSubjectCode,
        answerText: answerText ?? this.answerText,
        fullMarks: fullMarks ?? this.fullMarks,
        obtainedMarks: obtainedMarks ?? this.obtainedMarks,
        feedback: feedback ?? this.feedback,
      );

  factory Answer.fromRawJson(String str) => Answer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    id: json["id"],
    examSubjectId: json["examSubjectId"],
    examSubjectName: json["examSubjectName"],
    examSubjectCode: json["examSubjectCode"],
    answerText: json["answerText"],
    fullMarks: json["fullMarks"],
    obtainedMarks: json["obtainedMarks"],
    feedback: json["feedback"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "examSubjectId": examSubjectId,
    "examSubjectName": examSubjectName,
    "examSubjectCode": examSubjectCode,
    "answerText": answerText,
    "fullMarks": fullMarks,
    "obtainedMarks": obtainedMarks,
    "feedback": feedback,
  };
}
