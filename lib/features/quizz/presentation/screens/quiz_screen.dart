import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/common/widgets/alert/confirmation_dialog.dart';
import 'package:quizz_app/features/common/widgets/root_stack.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/custom_latex.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/next_button.dart';

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

          return _QuizContent(state: state, theme: theme);
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

class _QuizContent extends StatelessWidget {
  final QuizState state;
  final ThemeData theme;

  const _QuizContent({required this.state, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _QuizHeader(state: state),
              const SizedBox(height: 12),
              _QuestionCard(questionState: state, theme: theme),
              const SizedBox(height: 20),
              NextButton(
                onPressed: () => context.read<QuizCubit>().next(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizHeader extends StatelessWidget {
  final QuizState state;
  const _QuizHeader({required this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Q${state.index + 1}/${state.total}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        if (state.timer != null) Text('⏳ ${state.timer}s'),
      ],
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final QuizState questionState;
  final ThemeData theme;

  const _QuestionCard({required this.questionState, required this.theme});

  @override
  Widget build(BuildContext context) {
    final q = questionState.questions[questionState.index];
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CategoryTags(category: q.category),
          const SizedBox(height: 16),
          LatexText(
            q.question,
            style: textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 20),
          ...List.generate(q.options.length, (i) {
            return _OptionTile(
              option: q.options[i],
              index: i,
              correctIndex: q.answerIndex,
              state: questionState,
              theme: theme,
            );
          }),
        ],
      ),
    );
  }
}

class _CategoryTags extends StatelessWidget {
  final String category;
  const _CategoryTags({required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Tag(text: category, color: Colors.red.shade50, textColor: Colors.red),
        const SizedBox(width: 8),
        _Tag(
          text: StringRes.challenge,
          color: Colors.grey.shade200,
          textColor: Colors.black87,
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _Tag({
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String option;
  final int index;
  final int correctIndex;
  final QuizState state;
  final ThemeData theme;

  const _OptionTile({
    required this.option,
    required this.index,
    required this.correctIndex,
    required this.state,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: state.selected == null
            ? () => context.read<QuizCubit>().select(index)
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.cardColor,
            border: Border.all(
              color: _borderColor(state, index, correctIndex, scheme),
            ),
          ),
          child: Row(
            children: [
              Text(
                "${String.fromCharCode(97 + index)})",
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: LatexText(
                  option,
                  style: textTheme.bodyMedium?.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _borderColor(QuizState s, int i, int correct, ColorScheme scheme) {
    if (s.selected == null) return scheme.outlineVariant;
    if (i == correct) return Colors.green;
    if (i == s.selected && s.selected != correct) return Colors.red;
    return scheme.outlineVariant;
  }
}
