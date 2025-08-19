import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/quizz/data/datasource/local_question_data_source.dart';
import 'package:quizz_app/features/quizz/data/mapper/question_mapper.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';
import 'package:quizz_app/features/quizz/domain/repository/question_repository.dart';

@LazySingleton(as: QuestionRepository)
class LocalQuestionRepository implements QuestionRepository {
  final LocalQuestionDataSource _dataSource;
  final QuestionMapper _mapper;

  LocalQuestionRepository(this._dataSource, this._mapper);

  @override
  Future<List<QuestionEntity>> loadQuestions() async {
    final questions = await _dataSource.loadQuestions();
    return questions.map(_mapper.toEntity).toList();
  }
}
