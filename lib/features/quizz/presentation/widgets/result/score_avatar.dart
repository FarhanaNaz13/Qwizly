import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class ScoreAvatar extends StatelessWidget {
  const ScoreAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: AppColors.purple.withOpacity(0.1),
      child: Icon(
        Icons.emoji_events,
        size: 32,
        color: AppColors.purpleCom[300],
      ),
    );
  }
}
