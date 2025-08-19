import 'package:equatable/equatable.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';

class QuizState extends Equatable {
  final bool loading;
  final List<QuestionEntity> allQuestions;
  final List<QuestionEntity> questions;
  final int index;
  final int? selected;
  final int score;
  final bool finished;
  final int? timer;
  final String? category;

  const QuizState({
    this.loading = true,
    this.allQuestions = const [],
    this.questions = const [],
    this.index = 0,
    this.selected,
    this.score = 0,
    this.finished = false,
    this.timer,
    this.category = "General",
  });

  int get total => questions.length;

  QuizState copyWith({
    bool? loading,
    List<QuestionEntity>? allQuestions,
    List<QuestionEntity>? questions,
    int? index,
    int? selected,
    int? score,
    bool? finished,
    int? timer,
    String? category,
  }) =>
      QuizState(
        loading: loading ?? this.loading,
        allQuestions: allQuestions ?? this.allQuestions,
        questions: questions ?? this.questions,
        index: index ?? this.index,
        selected: selected,
        score: score ?? this.score,
        finished: finished ?? this.finished,
        timer: timer,
        category: category,
      );

  @override
  List<Object?> get props => [
        loading,
        allQuestions,
        questions,
        index,
        selected,
        score,
        finished,
        timer,
        category,
      ];
}
