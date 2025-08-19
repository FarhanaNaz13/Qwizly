import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';
import 'package:quizz_app/features/leader_board/presentation/widgets/podium_tile.dart';
class PodiumRow extends StatelessWidget {
  final List<LeaderboardEntry> top3;
  const PodiumRow({super.key, required this.top3});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PodiumTile(
            rank: 2,
            name: top3.length > 1 ? top3[1].name : "",
            score: top3.length > 1 ? top3[1].score : 0,
            color: AppColors.blue[600]!,
            height: 160,
          ),
          PodiumTile(
            rank: 1,
            name: top3.isNotEmpty ? top3[0].name : "",
            score: top3.isNotEmpty ? top3[0].score : 0,
            color: AppColors.red[300]!,
            height: 200,
          ),
          PodiumTile(
            rank: 3,
            name: top3.length > 2 ? top3[2].name : "",
            score: top3.length > 2 ? top3[2].score : 0,
            color: AppColors.purple,
            height: 140,
          ),
        ],
      ),
    );
  }
}

