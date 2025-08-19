import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/app_filled_button.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/app_router.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = context.read<QuizCubit>().state;

    return RootStack(
      title: StringRes.resultsTitle,
      resizeToAvoidBottomInset: false,
      onBack: () => context.go(RoutePath.quizCategory),
      enableDrawer: false,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: _ResultCard(
                score: state.score,
                total: state.total,
                controller: _controller,
                onSave: (name) async {
                  final leaderboardCubit = context.read<LeaderboardCubit>();
                  await leaderboardCubit.addScore(
                      name, state.score, state.total);
                  if (mounted) {
                    rootNavigatorKey.currentContext!
                        .go(RoutePath.leaderBoard, extra: "home");
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final int score;
  final int total;
  final TextEditingController controller;
  final ValueChanged<String> onSave;

  const _ResultCard({
    required this.score,
    required this.total,
    required this.controller,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.purple.withValues(alpha: 0.1),
              child: const Icon(Icons.emoji_events,
                  size: 40, color: AppColors.purple),
            ),
            const SizedBox(height: 16),
            Text(
              StringRes.yourScore,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              "$score / $total",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.purple,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: StringRes.enterName,
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            AppFilledButton(
              label: StringRes.saveToLeaderboard,
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  onSave(controller.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(StringRes.pleaseEnterName),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
