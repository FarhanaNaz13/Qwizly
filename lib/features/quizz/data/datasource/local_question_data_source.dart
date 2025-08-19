import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/quizz/data/model/question.dart';
import 'package:quizz_app/resource/assets.gen.dart';

@lazySingleton
class LocalQuestionDataSource {
  Future<List<Question>> loadQuestions() async {
    final jsonStr = await rootBundle.loadString(QuizzAsset.json.questions);
    return Question.fromJsonList(jsonStr);
  }
}
