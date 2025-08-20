import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/quizz/application/quiz_builder.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_card.dart';

class QuizTypeWidget extends StatelessWidget {
  final Color? color;
  const QuizTypeWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        final quizzes = QuizBuilder().buildFromQuestions(state.allQuestions);

        return state.loading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: QuizCard(
                      quiz: quizzes[index],
                      color: color,
                    ),
                  );
                },
              );
      },
    );
  }
}
