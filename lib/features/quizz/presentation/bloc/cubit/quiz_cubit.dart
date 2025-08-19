import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/quizz/domain/repository/question_repository.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final QuestionRepository repo;
  final int? perQuestionSeconds;
  Timer? _ticker;

  QuizCubit(this.repo, {this.perQuestionSeconds}) : super(const QuizState());

  Future<void> start({String? category}) async {
    emit(state.copyWith(loading: true));

    final allQuestions = await repo.loadQuestions();

    final filtered = category == null
        ? allQuestions
        : allQuestions.where((q) => q.category == category).toList();

    emit(QuizState(
      loading: false,
      questions: filtered,
      allQuestions: allQuestions,
      index: 0,
      score: 0,
      selected: null,
      finished: false,
      timer: perQuestionSeconds,
      category: category
    ));

    _startTimerIfNeeded();
  }



  void select(int option) {
    if (state.selected != null || state.finished) return;
    final current = state.questions[state.index];
    final correct = option == current.answerIndex;
    emit(state.copyWith(
      selected: option,
      score: correct ? state.score + 1 : state.score,
    ));
    _stopTimer();
  }

  void next() {
    if (state.index + 1 >= state.questions.length) {
      _stopTimer();
      emit(state.copyWith(finished: true));
      return;
    }
    emit(state.copyWith(
      index: state.index + 1,
      selected: null,
      timer: perQuestionSeconds,
    ));
    _startTimerIfNeeded();
  }

  void _startTimerIfNeeded() {
    _stopTimer();
    if (perQuestionSeconds == null) return;
    _ticker = Timer.periodic(const Duration(seconds: 1), (t) {
      final remain = (state.timer ?? 0) - 1;
      if (remain <= 0) {
        emit(state.copyWith(timer: 0, selected: state.selected ?? -1));
        next();
      } else {
        emit(state.copyWith(timer: remain));
      }
    });
  }

  void _stopTimer() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}
