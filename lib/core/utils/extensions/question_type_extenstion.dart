import 'package:learning_management/core/utils/enums/enums.dart';

extension QuestionTypeX on QuestionType {
  bool get isSingleChoice => this == QuestionType.singleChoice;
  bool get isMultipleChoice => this == QuestionType.multipleChoice;
  bool get isShortAnswer => this == QuestionType.shortAnswer;
}