import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const factory Question({
    required int id,
    @Default('General') String category,
    required String question,
    required List<String> options,
    required int answerIndex,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static List<Question> fromJsonList(String jsonStr) {
    final data = json.decode(jsonStr) as List<dynamic>;
    return data.map((e) => Question.fromJson(e as Map<String, dynamic>)).toList();
  }
}
