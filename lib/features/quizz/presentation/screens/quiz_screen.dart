import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/alert/confirmation_dialog.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_widgets/quiz_content.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RootStack(
      title: StringRes.quiz,
      showBottomNav: false,
      showFloatingActionButton: false,
      enableDrawer: false,
      onBack: () => _onBack(context),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.finished) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.go(RoutePath.result);
            });
            return const SizedBox.shrink();
          }

          return QuizContent(state: state, theme: theme);
        },
      ),
    );
  }

  void _onBack(BuildContext context) {
    ConfirmationDialog.show(
      context,
      title: StringRes.skipAlert,
      message: StringRes.skipAlertMsg,
      onSkip: () => context.go(RoutePath.quizCategory),
      onContinue: () {},
    );
  }
}
