import 'package:equatable/equatable.dart';

class AnswerEntity extends Equatable{
  final int? questionId;
  final String? writtenAnswer;
  final List<int>? selectedOptionIndexes;

  const AnswerEntity({
    this.questionId,
    this.writtenAnswer,
    this.selectedOptionIndexes,
  });

  AnswerEntity copyWith({
    int? questionId,
    String? writtenAnswer,
    List<int>? selectedOptionIndexes,
  }) =>
      AnswerEntity(
        questionId: questionId ?? this.questionId,
        writtenAnswer: writtenAnswer ?? this.writtenAnswer,
        selectedOptionIndexes: selectedOptionIndexes ?? this.selectedOptionIndexes,
      );

  @override
  List<Object?> get props => [
    questionId,
    writtenAnswer,
    selectedOptionIndexes
  ];
}