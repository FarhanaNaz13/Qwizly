import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/app_router.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/animated_play_again_button.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/result/result_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizState = context.read<QuizCubit>().state;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return RootStack(
      title: StringRes.resultsTitle,
      resizeToAvoidBottomInset: false, // FAB stays pinned
      onBack: () => context.go(RoutePath.quizCategory),
      enableDrawer: false,
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: AnimatedPlayAgainButton(),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: AnimatedPadding(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                        padding: EdgeInsets.only(bottom: keyboardHeight),
                        child: Align(
                          alignment: Alignment.center,
                          child: ResultCard(
                            score: quizState.score,
                            total: quizState.total,
                            onSave: (name) =>
                                _saveScore(context, name, quizState),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveScore(
      BuildContext context, String name, QuizState state) async {
    final leaderboardCubit = context.read<LeaderboardCubit>();
    await leaderboardCubit.addScore(name, state.score, state.total);
    if (context.mounted) {
      rootNavigatorKey.currentContext!
          .go(RoutePath.leaderBoard, extra: "home");
    }
  }
}


// Expanded(
//   child: Center(
//     child: ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 400),
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.all(16),
//         child: ResultCard(
//           score: quizState.score,
//           total: quizState.total,
//           onSave: (name) => _saveScore(context, name, quizState),
//         ),
//       ),
//     ),
//   ),
// ),
