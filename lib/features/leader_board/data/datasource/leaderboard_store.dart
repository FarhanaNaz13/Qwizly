import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:quizz_app/features/core/utils/constant/keys.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';

@lazySingleton
class LeaderboardStore {
  static const boxName = KeyConstant.leaderboard;
  Future<void> add(LeaderboardEntry entry) async {
    final box = await Hive.openBox<LeaderboardEntry>(boxName);
    await box.add(entry);
  }

  Future<List<LeaderboardEntry>> topList({int limit = 50}) async {
    final box = await Hive.openBox<LeaderboardEntry>(boxName);
    final list = box.values.toList()
      ..sort((a, b) {
        final s = b.score.compareTo(a.score);
        return s != 0 ? s : a.createdAt.compareTo(b.createdAt);
      });
    return list.take(limit).toList();
  }
}
