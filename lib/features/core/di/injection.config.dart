// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:quizz_app/features/core/di/register_module.dart' as _i229;
import 'package:quizz_app/features/friends/domain/repository/points_repository.dart'
    as _i284;
import 'package:quizz_app/features/friends/domain/usecase/share_with_reward.dart'
    as _i952;
import 'package:quizz_app/features/friends/presentation/cuibit/points_cubit.dart'
    as _i275;
import 'package:quizz_app/features/friends/share/services/share_services.dart'
    as _i221;
import 'package:quizz_app/features/home/presentation/screens/cubit/featured_quiz_cubit.dart'
    as _i420;
import 'package:quizz_app/features/leader_board/data/datasource/leaderboard_store.dart'
    as _i951;
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart'
    as _i218;
import 'package:quizz_app/features/quizz/data/datasource/local_question_data_source.dart'
    as _i798;
import 'package:quizz_app/features/quizz/data/mapper/question_mapper.dart'
    as _i828;
import 'package:quizz_app/features/quizz/data/repository/local_question_repository_impl.dart'
    as _i976;
import 'package:quizz_app/features/quizz/domain/repository/question_repository.dart'
    as _i119;
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart'
    as _i134;
import 'package:quizz_app/features/theme/cubit/theme_cubit.dart' as _i564;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i986.Box<dynamic>>(
      () => registerModule.box(),
      preResolve: true,
    );
    gh.factory<_i828.QuestionMapper>(() => _i828.QuestionMapper());
    gh.lazySingleton<_i798.LocalQuestionDataSource>(
        () => _i798.LocalQuestionDataSource());
    gh.lazySingleton<_i951.LeaderboardStore>(() => _i951.LeaderboardStore());
    gh.lazySingleton<_i284.PointsRepository>(() => _i284.PointsRepository());
    gh.lazySingleton<_i221.ShareService>(() => _i221.ShareService());
    gh.lazySingleton<_i218.LeaderboardCubit>(
        () => registerModule.leaderboardCubit(gh<_i951.LeaderboardStore>()));
    gh.lazySingleton<_i952.ShareWithRewardUseCase>(
        () => _i952.ShareWithRewardUseCase(gh<_i221.ShareService>()));
    gh.lazySingleton<_i119.QuestionRepository>(
        () => _i976.LocalQuestionRepository(
              gh<_i798.LocalQuestionDataSource>(),
              gh<_i828.QuestionMapper>(),
            ));
    gh.lazySingleton<_i275.PointsCubit>(
        () => registerModule.pointCubit(gh<_i284.PointsRepository>()));
    gh.lazySingleton<_i564.ThemeCubit>(
        () => registerModule.themeCubit(gh<_i986.Box<dynamic>>()));
    gh.lazySingleton<_i134.QuizCubit>(
        () => registerModule.quizCubit(gh<_i119.QuestionRepository>()));
    gh.lazySingleton<_i420.FeaturedQuizCubit>(
        () => registerModule.featuredQuizCubit(gh<_i134.QuizCubit>()));
    return this;
  }
}

class _$RegisterModule extends _i229.RegisterModule {}
