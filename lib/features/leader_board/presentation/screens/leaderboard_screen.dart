import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_state.dart';
import 'package:quizz_app/features/leader_board/presentation/widgets/leaderboard_list.dart';
import 'package:quizz_app/features/leader_board/presentation/widgets/leaderboard_toggle.dart';
import 'package:quizz_app/features/leader_board/presentation/widgets/podium_row.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final from = GoRouterState.of(context).extra as String?;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return RootStack(
      title: StringRes.leaderboardTitle,
      showBackButton: true,
      onBack: () {
        if (from == "quizCategory") {
          context.go(RoutePath.quizCategory);
        } else {
          context.go(RoutePath.home);
        }
      },
      body: BlocBuilder<LeaderboardCubit, LeaderboardState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.entries.isEmpty) {
            return Center(
              child: Text(
                StringRes.noScoresYet,
                style: textTheme.bodyMedium,
              ),
            );
          }

          final entries = state.entries;
          final top3 = entries.take(3).toList();
          final others = entries.skip(3).toList();

          return Column(
            children: [
              const LeaderboardToggle(),
              PodiumRow(top3: top3),
              if (others.isNotEmpty)
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0, -24),
                    child: LeaderboardList(entries: others),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
