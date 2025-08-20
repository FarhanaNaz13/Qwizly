import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/constant.dart';
import 'package:quizz_app/features/home/presentation/screens/cubit/featured_quiz_state.dart';
import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';

class FeaturedQuizCubit extends Cubit<FeaturedQuizState> {
  final QuizCubit quizCubit;
  final String category;
  late final StreamSubscription _quizSub;

  FeaturedQuizCubit({
    required this.quizCubit,
    this.category = StringRes.generalKnowledge,
  }) : super(const FeaturedQuizState()) {
    _quizSub = quizCubit.stream.listen((quizState) {
      _loadCategoryData(quizState.allQuestions);
    });

    _loadCategoryData(quizCubit.state.allQuestions);
  }

  void _loadCategoryData(List<QuestionEntity> allQuizzes) {
    final filtered = allQuizzes.where((q) => q.category == category).toList();

    final totalQuestions = filtered.length;
    final totalTimeSec = totalQuestions * Constant.perQuestionSeconds;
    final totalTimeMin = (totalTimeSec / Constant.sixty).ceil();

    emit(
      FeaturedQuizState(
        filteredQuizzes: filtered,
        totalQuestions: totalQuestions,
        totalTimeMin: totalTimeMin,
      ),
    );
  }

  @override
  Future<void> close() {
    _quizSub.cancel();
    return super.close();
  }
}
