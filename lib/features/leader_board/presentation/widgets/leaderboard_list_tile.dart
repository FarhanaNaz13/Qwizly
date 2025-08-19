import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class LeaderboardListTile extends StatelessWidget {
  final LeaderboardEntry entry;
  final int index;
  const LeaderboardListTile(
      {super.key, required this.entry, required this.index});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).round()),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: SizedBox(
          width: 80,
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.white,
                child: Text(
                  '${index + 4}',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.purple,
                backgroundImage:
                    AssetImage(QuizzAsset.icons.avatar.coolAvatar.path),
              ),
            ],
          ),
        ),
        title: Text(
          entry.name,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.grayBlack),
        ),
        subtitle: Text(
          "${entry.score} ${StringRes.points}",
          style: textTheme.bodyMedium?.copyWith(color: AppColors.grayBlack),
        ),
      ),
    );
  }
}
