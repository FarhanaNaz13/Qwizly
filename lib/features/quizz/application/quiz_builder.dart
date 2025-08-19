import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';
import 'package:quizz_app/features/quizz/domain/entity/quiz.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class QuizBuilder {
  List<Quiz> buildFromQuestions(List<QuestionEntity> questions) {
    final grouped = groupBy(questions, (q) => q.category);

    return grouped.entries.map((entry) {
      final category = entry.key;
      final totalQuizzes = entry.value.length;

      return Quiz(
        title: category,
        totalQuizzes: totalQuizzes,
        iconAsset: _iconForCategory(category),
        iconBackground: _colorForCategory(category),
        participants: 437,
      );
    }).toList();
  }

  String _iconForCategory(String category) {
    switch (category) {
      case 'Mathematics':
        return QuizzAsset.icons.home.fx2.path;
      case 'General Knowledge':
        return QuizzAsset.icons.home.generalPng.path;
      case 'Statistics':
        return QuizzAsset.icons.home.stat.path;
      default:
        return QuizzAsset.icons.home.fx.path;
    }
  }

  Color _colorForCategory(String category) {
    switch (category) {
      case 'Mathematics':
        return Colors.blue.shade100;
      case 'General Knowledge':
        return Colors.pink.shade100;
        case 'Statistics':
        return Colors.blue.shade100;
      default:
        return Colors.grey.shade200;
    }
  }
}
