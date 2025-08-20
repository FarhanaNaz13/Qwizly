import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/next_button.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_widgets/question_card.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_widgets/quiz_header.dart';
class QuizContent extends StatelessWidget {
  final QuizState state;
  final ThemeData theme;

  const QuizContent({super.key, required this.state, required this.theme});

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
              QuizHeader(state: state),
              const SizedBox(height: 12),
              QuestionCard(state: state, theme: theme),
              const SizedBox(height: 20),
              NextButton(onPressed: () => context.read<QuizCubit>().next()),
            ],
          ),
        ),
      ),
    );
  }
}