import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quizz_app/features/quizz/data/datasource/local_question_data_source.dart';
import 'package:quizz_app/features/quizz/data/mapper/question_mapper.dart';
import 'package:quizz_app/features/quizz/data/model/question.dart';
import 'package:quizz_app/features/quizz/data/repository/local_question_repository_impl.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';

class MockLocalQuestionDataSource extends Mock
    implements LocalQuestionDataSource {}

class MockQuestionMapper extends Mock implements QuestionMapper {}

void main() {
  late LocalQuestionRepository repository;
  late MockLocalQuestionDataSource mockDataSource;
  late MockQuestionMapper mockMapper;

  setUp(() {
    mockDataSource = MockLocalQuestionDataSource();
    mockMapper = MockQuestionMapper();
    repository = LocalQuestionRepository(mockDataSource, mockMapper);
  });

  test('loadQuestions calls dataSource and maps results', () async {
    final question1 = Question(
      question: 'Q1',
      options: ['A', 'B'],
      answerIndex: 0,
      category: 'Math',
      id: 1,
    );
    final question2 = Question(
      question: 'Q2',
      options: ['C', 'D'],
      answerIndex: 1,
      category: 'Science',
      id: 2,
    );

    final questionEntities = [
      const QuestionEntity(
          question: 'Q1',
          options: ['A', 'B'],
          answerIndex: 0,
          category: 'Math',
          id: 1),
      const QuestionEntity(
          question: 'Q2',
          options: ['C', 'D'],
          answerIndex: 1,
          category: 'Science',
          id: 2),
    ];

    when(() => mockDataSource.loadQuestions())
        .thenAnswer((_) async => [question1, question2]);

    when(() => mockMapper.toEntity(question1)).thenReturn(questionEntities[0]);
    when(() => mockMapper.toEntity(question2)).thenReturn(questionEntities[1]);

    final result = await repository.loadQuestions();

    expect(result, questionEntities);
    verify(() => mockDataSource.loadQuestions()).called(1);
    verify(() => mockMapper.toEntity(question1)).called(1);
    verify(() => mockMapper.toEntity(question2)).called(1);
  });
}
