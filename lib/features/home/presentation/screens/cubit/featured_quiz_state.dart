import 'package:quizz_app/features/quizz/domain/entity/question_entity.dart';

class FeaturedQuizState {
  final List<QuestionEntity> filteredQuizzes;
  final int totalQuestions;
  final int totalTimeMin;

  const FeaturedQuizState({
    this.filteredQuizzes = const [],
    this.totalQuestions = 0,
    this.totalTimeMin = 0,
  });

  FeaturedQuizState copyWith({
    List<QuestionEntity>? filteredQuizzes,
    int? totalQuestions,
    int? totalTimeMin,
  }) {
    return FeaturedQuizState(
      filteredQuizzes: filteredQuizzes ?? this.filteredQuizzes,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      totalTimeMin: totalTimeMin ?? this.totalTimeMin,
    );
  }
}
