import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/quizz/domain/entity/quiz.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_cubit.dart';

class QuizCard extends StatelessWidget {
  final Quiz quiz;
  final Color? color;

  const QuizCard({
    super.key,
    required this.quiz,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<QuizCubit>().start(category: quiz.title);
        context.push(RoutePath.quizz);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            _QuizIcon(
                iconAsset: quiz.iconAsset, background: quiz.iconBackground),
            const SizedBox(width: 12),
            Expanded(child: _QuizInfo(quiz: quiz)),
            _ScoreBoardButton(),
          ],
        ),
      ),
    );
  }
}

class _QuizIcon extends StatelessWidget {
  final String iconAsset;
  final Color background;

  const _QuizIcon({required this.iconAsset, required this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Image.asset(iconAsset, width: 35, height: 35),
      ),
    );
  }
}

class _QuizInfo extends StatelessWidget {
  final Quiz quiz;

  const _QuizInfo({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.dark,
          ),
        ),
        Text(
          '${quiz.totalQuizzes.toString().padLeft(2, '0')} ${StringRes.quizzes}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        _ParticipantsRow(participants: quiz.participants),
      ],
    );
  }
}

class _ParticipantsRow extends StatelessWidget {
  final int participants;

  const _ParticipantsRow({required this.participants});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 10, backgroundColor: Colors.pinkAccent),
        const SizedBox(width: 4),
        const CircleAvatar(radius: 10, backgroundColor: Colors.tealAccent),
        const SizedBox(width: 8),
        Text(
          '+$participants ${StringRes.peopleJoin}',
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }
}

class _ScoreBoardButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        context.go(RoutePath.leaderBoard, extra: "quizCategory");
      },
      icon: const Icon(Icons.bar_chart, color: Colors.purple),
      label: const Text(
        StringRes.scoreBoard,
        style: TextStyle(color: Colors.purple),
      ),
    );
  }
}
