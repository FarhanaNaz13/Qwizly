import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/quizz/data/model/question.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';

@injectable
class QuestionMapper {
  QuestionEntity toEntity(Question model) => QuestionEntity(
    id: model.id,
    category: model.category,
    question: model.question,
    options: model.options,
    answerIndex: model.answerIndex,
  );


   Question fromEntity(QuestionEntity entity) {
    return Question(
      id: entity.id,
      category: entity.category,
      question: entity.question,
      options: entity.options,
      answerIndex: entity.answerIndex,
    );
  }
}
