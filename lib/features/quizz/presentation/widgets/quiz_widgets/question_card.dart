import 'package:flutter/material.dart';

import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/custom_latex.dart';

import 'card_container.dart';
import 'category_tags.dart';
import 'option_tile.dart';

class QuestionCard extends StatelessWidget {
  final QuizState state;
  final ThemeData theme;

  const QuestionCard({super.key, required this.state, required this.theme});

  @override
  Widget build(BuildContext context) {
    final question = state.questions[state.index];

    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryTags(category: question.category),
          const SizedBox(height: 16),
          LatexText(question.question, style: theme.textTheme.titleLarge?.copyWith(fontSize: 20)),
          const SizedBox(height: 20),
          ...List.generate(
            question.options.length,
                (i) => OptionTile(
              option: question.options[i],
              index: i,
              correctIndex: question.answerIndex,
              state: state,
              theme: theme,
            ),
          ),
        ],
      ),
    );
  }
}