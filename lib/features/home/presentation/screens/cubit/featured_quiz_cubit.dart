import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/constant.dart';
import 'package:quizz_app/features/home/presentation/screens/cubit/featured_quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';

class FeaturedQuizCubit extends Cubit<FeaturedQuizState> {
  final QuizCubit quizCubit;
  final String category;

  FeaturedQuizCubit({
    required this.quizCubit,
    this.category = StringRes.generalKnowledge,
  }) : super(const FeaturedQuizState()) {
    _loadCategoryData();
  }

  void _loadCategoryData() {
    final allQuizzes = quizCubit.state.allQuestions;

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
}
