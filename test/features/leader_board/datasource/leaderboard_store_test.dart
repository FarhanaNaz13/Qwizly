import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:quizz_app/features/leader_board/data/datasource/leaderboard_store.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  late LeaderboardStore store;

  setUp(() async {
    await setUpTestHive();
    Hive.registerAdapter(LeaderboardEntryAdapter());
    store = LeaderboardStore();
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  test(
      'add entries and get top list sorted by score descending, then date ascending',
      () async {
    final entry1 = LeaderboardEntry(
      name: 'Naz',
      score: 100,
      total: 200,
      createdAt: DateTime.parse('2025-08-19 10:00:00'),
    );

    final entry2 = LeaderboardEntry(
      name: 'Fuad',
      score: 150,
      total: 180,
      createdAt: DateTime.parse('2025-08-19 09:00:00'),
    );

    final entry3 = LeaderboardEntry(
      name: 'Wakib',
      score: 100,
      total: 190,
      createdAt: DateTime.parse('2025-08-19 09:30:00'),
    );

    await store.add(entry1);
    await store.add(entry2);
    await store.add(entry3);

    final topList = await store.topList();

    expect(topList[0].name, 'Fuad');
    expect(topList[1].name, 'Wakib');
    expect(topList[2].name, 'Naz');

    final limitedList = await store.topList(limit: 2);
    expect(limitedList.length, 2);
    expect(limitedList[0].name, 'Fuad');
    expect(limitedList[1].name, 'Wakib');
  });
}
