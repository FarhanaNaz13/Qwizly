import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/friends/presentation/connect_friends_screen.dart';
import 'package:quizz_app/features/home/presentation/screens/home_screen.dart';
import 'package:quizz_app/features/leader_board/presentation/screens/leaderboard_screen.dart';
import 'package:quizz_app/features/quizz/presentation/screens/quiz_category_screen.dart';
import 'package:quizz_app/features/quizz/presentation/screens/quiz_screen.dart';
import 'package:quizz_app/features/quizz/presentation/screens/results_screen.dart';
import 'package:quizz_app/features/splash_intro/presentation/screens/intro_screen.dart';
import 'package:quizz_app/features/splash_intro/presentation/screens/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter routes;

  AppRouter({required bool isIntroDone})
      : routes = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: isIntroDone ? RoutePath.home : RoutePath.splash,
    routes: [
      GoRoute(
        path: RoutePath.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutePath.intro,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutePath.leaderBoard,
        builder: (context, state) => const LeaderboardScreen(),
      ),
      GoRoute(
        path: RoutePath.quizz,
        builder: (context, state) => const QuizScreen(),
      ),
      GoRoute(
        path: RoutePath.result,
        builder: (context, state) => const ResultsScreen(),
      ),
      GoRoute(
        path: RoutePath.friends,
        builder: (context, state) => ConnectWithFriendsScreen(),
      ),
      GoRoute(
        path: RoutePath.quizCategory,
        builder: (context, state) => const QuizCategoryScreen(),
      ),
    ],
  );
}
