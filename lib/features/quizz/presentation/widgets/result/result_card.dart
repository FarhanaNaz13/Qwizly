import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/result/name_input_field.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/result/save_button.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/result/score_avatar.dart';

class ResultCard extends StatefulWidget {
  final int score;
  final int total;
  final ValueChanged<String> onSave;

  const ResultCard({
    required this.score,
    required this.total,
    required this.onSave,
    super.key,
  });

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            const ScoreAvatar(),
            const SizedBox(height: 16),
            Text(
              StringRes.yourScore,
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              "${widget.score} / ${widget.total}",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.purpleCom[800],
              ),
            ),
            const SizedBox(height: 20),
            NameInputField(controller: _controller),
            const SizedBox(height: 20),
            SaveButton(
              controller: _controller,
              onSave: widget.onSave,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
