import 'package:flutter/material.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';
import 'package:quizz_app/features/leader_board/presentation/widgets/leaderboard_list_tile.dart';

class LeaderboardList extends StatelessWidget {
  final List<LeaderboardEntry> entries;
  const LeaderboardList({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 255),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 180),
              blurRadius: 15,
              spreadRadius: 5,
              offset: const Offset(0, 0),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 26),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: ListView.separated(
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) =>
                LeaderboardListTile(entry: entries[i], index: i),
          ),
        ),
      ),
    );
  }
}
