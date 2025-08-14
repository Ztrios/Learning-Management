import 'dart:convert';

import 'package:learning_management/features/subject_details/domain/entities/answer_entity.dart';

class AnswerModel {
  final int? questionId;
  final String? writtenAnswer;
  final List<int>? selectedOptionIndexes;

  AnswerModel({
    this.questionId,
    this.writtenAnswer,
    this.selectedOptionIndexes,
  });

  AnswerModel copyWith({
    int? questionId,
    String? writtenAnswer,
    List<int>? selectedOptionIndexes,
  }) =>
      AnswerModel(
        questionId: questionId ?? this.questionId,
        writtenAnswer: writtenAnswer ?? this.writtenAnswer,
        selectedOptionIndexes: selectedOptionIndexes ?? this.selectedOptionIndexes,
      );

  String toRawJson() => json.encode(toJson());

  factory AnswerModel.fromEntity(AnswerEntity answerEntity) => AnswerModel(
    questionId: answerEntity.questionId,
    writtenAnswer: answerEntity.writtenAnswer,
    selectedOptionIndexes: answerEntity.selectedOptionIndexes,
  );

  Map<String, dynamic> toJson() => {
    "questionId": questionId,
    "writtenAnswer": writtenAnswer,
    "selectedOptionIndexes": selectedOptionIndexes,
  };
}
