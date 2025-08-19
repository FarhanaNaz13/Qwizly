import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';
import 'package:quizz_app/features/quizz/domain/repository/question_repository.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';

class MockQuestionRepository extends Mock implements QuestionRepository {}

void main() {
  late QuizCubit cubit;
  late MockQuestionRepository mockRepo;

  final questions = [
    QuestionEntity(
      question: 'Q1',
      options: ['A', 'B', 'C', 'D'],
      answerIndex: 1,
      category: 'Math',
      id: 1,
    ),
    QuestionEntity(
      question: 'Q2',
      options: ['A', 'B', 'C', 'D'],
      answerIndex: 2,
      category: 'Science',
      id: 2,
    ),
  ];

  setUp(() {
    mockRepo = MockQuestionRepository();
    cubit = QuizCubit(mockRepo, perQuestionSeconds: 5);
  });

  tearDown(() async {
    await cubit.close();
  });

  test('start loads questions and sets initial state', () async {
    when(() => mockRepo.loadQuestions()).thenAnswer((_) async => questions);

    await cubit.start();

    expect(cubit.state.loading, false);
    expect(cubit.state.questions.length, 2);
    expect(cubit.state.index, 0);
    expect(cubit.state.score, 0);
    expect(cubit.state.timer, 5);
  });

  test('start filters questions by category', () async {
    when(() => mockRepo.loadQuestions()).thenAnswer((_) async => questions);

    await cubit.start(category: 'Math');

    expect(cubit.state.questions.length, 1);
    expect(cubit.state.questions.first.category, 'Math');
  });

  test('select updates score if correct', () async {
    when(() => mockRepo.loadQuestions()).thenAnswer((_) async => questions);
    await cubit.start();

    cubit.select(1);
    expect(cubit.state.score, 1);
    expect(cubit.state.selected, 1);
  });

  test('select does not change score if wrong', () async {
    when(() => mockRepo.loadQuestions()).thenAnswer((_) async => questions);
    await cubit.start();

    cubit.select(0);
    expect(cubit.state.score, 0);
    expect(cubit.state.selected, 0);
  });

  test('next increments index and resets selection', () async {
    when(() => mockRepo.loadQuestions()).thenAnswer((_) async => questions);
    await cubit.start();

    cubit.next();
    expect(cubit.state.index, 1);
    expect(cubit.state.selected, null);
    expect(cubit.state.finished, false);
  });

  test('next sets finished when last question', () async {
    when(() => mockRepo.loadQuestions()).thenAnswer((_) async => questions);
    await cubit.start();

    cubit.next();
    cubit.next();

    expect(cubit.state.finished, true);
  });
}
