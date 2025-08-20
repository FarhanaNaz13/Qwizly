import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final int id;
  final String category;
  final String question;
  final List<String> options;

  @JsonKey(name: 'answer_index')
  final int answerIndex;

  Question({
    required this.id,
    required this.category,
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static List<Question> fromJsonList(String jsonStr) {
    final data = json.decode(jsonStr) as List<dynamic>;
    return data
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}