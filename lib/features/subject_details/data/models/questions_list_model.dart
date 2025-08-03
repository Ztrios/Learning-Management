import 'dart:convert';

import 'package:learning_management/features/subject_details/domain/entities/questions_list_entity.dart';

class QuestionsListModel {
  final int? statusCode;
  final String? message;
  final QuestionsData? questionsData;

  QuestionsListModel({
    this.statusCode,
    this.message,
    this.questionsData,
  });

  QuestionsListModel copyWith({
    int? statusCode,
    String? message,
    QuestionsData? questionsData,
  }) =>
      QuestionsListModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        questionsData: questionsData ?? this.questionsData,
      );

  factory QuestionsListModel.fromRawJson(String str) => QuestionsListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionsListModel.fromJson(Map<String, dynamic> json) => QuestionsListModel(
    statusCode: json["statusCode"],
    message: json["message"],
    questionsData: json["data"] == null ? null : QuestionsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "data": questionsData?.toJson(),
  };

  QuestionsListEntity toEntity()=> QuestionsListEntity(
    statusCode: statusCode,
    message: message,
    questionsData: questionsData,
  );

}

class QuestionsData {
  final int? id;
  final String? title;
  final String? description;
  final double? totalMarks;
  final DateTime? quizDate;
  final String? startTime;
  final String? endTime;
  final int? lessonId;
  final Content? content;

  QuestionsData({
    this.id,
    this.title,
    this.description,
    this.totalMarks,
    this.quizDate,
    this.startTime,
    this.endTime,
    this.lessonId,
    this.content,
  });

  QuestionsData copyWith({
    int? id,
    String? title,
    String? description,
    double? totalMarks,
    DateTime? quizDate,
    String? startTime,
    String? endTime,
    int? lessonId,
    Content? content,
  }) =>
      QuestionsData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        totalMarks: totalMarks ?? this.totalMarks,
        quizDate: quizDate ?? this.quizDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        lessonId: lessonId ?? this.lessonId,
        content: content ?? this.content,
      );

  factory QuestionsData.fromRawJson(String str) => QuestionsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuestionsData.fromJson(Map<String, dynamic> json) => QuestionsData(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    totalMarks: json["totalMarks"],
    quizDate: json["quizDate"] == null ? null : DateTime.parse(json["quizDate"]),
    startTime: json["startTime"],
    endTime: json["endTime"],
    lessonId: json["lessonId"],
    content: json["content"] == null ? null : Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "totalMarks": totalMarks,
    "quizDate": "${quizDate!.year.toString().padLeft(4, '0')}-${quizDate!.month.toString().padLeft(2, '0')}-${quizDate!.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "endTime": endTime,
    "lessonId": lessonId,
    "content": content?.toJson(),
  };
}

class Content {
  final List<Question>? questions;

  Content({
    this.questions,
  });

  Content copyWith({
    List<Question>? questions,
  }) =>
      Content(
        questions: questions ?? this.questions,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class Question {
  final int? id;
  final String? questionText;
  final String? answerType;
  final List<Option>? options;
  final int? marks;

  Question({
    this.id,
    this.questionText,
    this.answerType,
    this.options,
    this.marks,
  });

  Question copyWith({
    int? id,
    String? questionText,
    String? answerType,
    List<Option>? options,
    int? marks,
  }) =>
      Question(
        id: id ?? this.id,
        questionText: questionText ?? this.questionText,
        answerType: answerType ?? this.answerType,
        options: options ?? this.options,
        marks: marks ?? this.marks,
      );

  factory Question.fromRawJson(String str) => Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    questionText: json["questionText"],
    answerType: json["answerType"],
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    marks: json["marks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "questionText": questionText,
    "answerType": answerType,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    "marks": marks,
  };
}

class Option {
  final String? text;
  final bool? correct;

  Option({
    this.text,
    this.correct,
  });

  Option copyWith({
    String? text,
    bool? correct,
  }) =>
      Option(
        text: text ?? this.text,
        correct: correct ?? this.correct,
      );

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    text: json["text"],
    correct: json["correct"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "correct": correct,
  };
}
