import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/core/di/injection.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/friends/presentation/cuibit/points_cubit.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/theme/app_theme.dart';
import 'package:quizz_app/features/theme/cubit/theme_cubit.dart';

import 'features/core/router/app_router.dart';
import 'features/core/utils/constant/keys.dart';
import 'features/leader_board/domain/entity/leaderboard_entry.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.registerAdapter(LeaderboardEntryAdapter());

  await configureDependencies();

  final themeCubit = getIt<ThemeCubit>();
  final quizCubit = getIt<QuizCubit>();
  final leaderboardCubit = getIt<LeaderboardCubit>();
  final pointsCubit = getIt<PointsCubit>();

  final questionsNotifier = ValueNotifier(quizCubit.state.questions.isEmpty);
  quizCubit.stream.listen((state) {
    questionsNotifier.value = state.questions.isEmpty;
  });

  final isIntroDone =
      getIt<Box>().get(KeyConstant.introDone, defaultValue: false) as bool;

  final appRouter = AppRouter(isIntroDone: isIntroDone);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: themeCubit),
        BlocProvider.value(value: quizCubit),
        BlocProvider.value(value: leaderboardCubit),
        BlocProvider.value(value: pointsCubit),
      ],
      child: MyApp(router: appRouter),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: StringRes.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<ThemeCubit>().state,
      routerConfig: router.routes,
    );
  }
}
