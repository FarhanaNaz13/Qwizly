import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/custom_latex.dart';

class OptionTile extends StatelessWidget {
  final String option;
  final int index;
  final int correctIndex;
  final QuizState state;
  final ThemeData theme;

  const OptionTile({super.key,
    required this.option,
    required this.index,
    required this.correctIndex,
    required this.state,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: state.selected == null ? () =>
            context.read<QuizCubit>().select(index) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.cardColor,
            border: Border.all(color: _borderColor(scheme)),
          ),
          child: Row(
            children: [
              Text(
                "${String.fromCharCode(97 + index)})",
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(width: 8),
              Expanded(child: LatexText(option,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
  Color _borderColor(ColorScheme scheme) {
    if (state.selected == null) return scheme.outlineVariant;
    if (index == correctIndex) return Colors.green;
    if (index == state.selected && state.selected != correctIndex) return Colors.red;
    return scheme.outlineVariant;
  }
}