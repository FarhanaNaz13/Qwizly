import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/core/utils/constant/constant.dart';
import 'package:quizz_app/features/core/utils/constant/keys.dart';
import 'package:quizz_app/features/friends/domain/repository/points_repository.dart';
import 'package:quizz_app/features/friends/presentation/cuibit/points_cubit.dart';
import 'package:quizz_app/features/home/presentation/screens/cubit/featured_quiz_cubit.dart';
import 'package:quizz_app/features/leader_board/data/datasource/leaderboard_store.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart';
import 'package:quizz_app/features/quizz/domain/repository/question_repository.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/theme/cubit/theme_cubit.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Box> box() async {
    await Hive.initFlutter();
    return await Hive.openBox(KeyConstant.settings);
  }

  @lazySingleton
  QuizCubit quizCubit(QuestionRepository repo) {
    final cubit = QuizCubit(repo, perQuestionSeconds: Constant.perQuestionSeconds);
    cubit.start();
    return cubit;
  }

  @lazySingleton
  ThemeCubit themeCubit(Box box) => ThemeCubit(box);

  @lazySingleton
  LeaderboardCubit leaderboardCubit(LeaderboardStore store) =>
      LeaderboardCubit(store)..load();

  @lazySingleton
  PointsCubit pointCubit(PointsRepository repo) => PointsCubit(repo);

  @lazySingleton
  FeaturedQuizCubit featuredQuizCubit(QuizCubit quizCubit) =>
      FeaturedQuizCubit(quizCubit: quizCubit);

}
