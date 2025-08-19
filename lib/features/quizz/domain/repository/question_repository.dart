import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';

abstract class QuestionRepository{
  Future<List<QuestionEntity>> loadQuestions();
}