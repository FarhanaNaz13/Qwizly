import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class PodiumTile extends StatelessWidget {
  final int rank;
  final String name;
  final int score;
  final Color color;
  final double height;

  const PodiumTile({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.color,
    required this.height,
  });

  String get medalAsset {
    switch (rank) {
      case 1:
        return QuizzAsset.icons.leaderBoard.gold;
      case 2:
        return QuizzAsset.icons.leaderBoard.silver;
      case 3:
        return QuizzAsset.icons.leaderBoard.bronze;
      default:
        return QuizzAsset.icons.leaderBoard.bronze;
    }
  }

  Color get circleColor {
    switch (rank) {
      case 1:
        return AppColors.pastelGreen;
      case 2:
        return AppColors.pastelPink;
      case 3:
        return AppColors.pastelBlue;
      default:
        return AppColors.blue[200]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: 100,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.withValues(alpha: 0.6),
                    color.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.only(top: 50, bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "$score ${StringRes.points}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -20,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: circleColor,
                    child: Text(
                      rank.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.dark,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -18,
                    child: SvgPicture.asset(
                      medalAsset,
                      width: 34,
                      height: 34,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
