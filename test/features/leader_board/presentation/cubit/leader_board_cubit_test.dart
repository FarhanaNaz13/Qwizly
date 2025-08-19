import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quizz_app/features/leader_board/data/datasource/leaderboard_store.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_cubit.dart';
import 'package:quizz_app/features/leader_board/presentation/bloc/cubit/leaderboard_state.dart';
import 'package:bloc_test/bloc_test.dart';

class MockLeaderboardStore extends Mock implements LeaderboardStore {}

class FakeLeaderboardEntry extends Fake implements LeaderboardEntry {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeLeaderboardEntry());
  });

  late LeaderboardCubit cubit;
  late MockLeaderboardStore mockStore;

  setUp(() {
    mockStore = MockLeaderboardStore();
    cubit = LeaderboardCubit(mockStore);
  });

  group('load', () {
    final entries = [
      LeaderboardEntry(
        name: 'Naz',
        score: 100,
        total: 200,
        createdAt: DateTime.now(),
      ),
      LeaderboardEntry(
        name: 'Fuad',
        score: 150,
        total: 180,
        createdAt: DateTime.now(),
      ),
    ];

    test('emits loading true, then entries from store', () async {
      when(() => mockStore.topList()).thenAnswer((_) async => entries);

      final expectedStates = [
        const LeaderboardState(loading: true, entries: []),
        LeaderboardState(loading: false, entries: entries),
      ];

      expectLater(cubit.stream, emitsInOrder(expectedStates));

      await cubit.load();

      verify(() => mockStore.topList()).called(1);
    });
  });

  group('addScore', () {
    final entry = LeaderboardEntry(
      name: 'Player',
      score: 50,
      total: 100,
      createdAt: DateTime.now(),
    );

    test('adds score and reloads list', () async {
      when(() => mockStore.add(any())).thenAnswer((_) async {});
      when(() => mockStore.topList()).thenAnswer((_) async => [entry]);

      final expectedStates = [
        const LeaderboardState(loading: true, entries: []),
        LeaderboardState(loading: false, entries: [entry]),
      ];

      expectLater(cubit.stream, emitsInOrder(expectedStates));

      await cubit.addScore('', 50, 100);

      verify(() => mockStore.add(any(
        that: isA<LeaderboardEntry>().having((e) => e.name, 'name', 'Player'),
      ))).called(1);
      verify(() => mockStore.topList()).called(1);
    });
  });




  blocTest<LeaderboardCubit, LeaderboardState>(
    'load emits loading true then entries',
    build: () {
      when(() => mockStore.topList()).thenAnswer(
            (_) async => [
          LeaderboardEntry(
            name: 'Naz',
            score: 100,
            total: 200,
            createdAt: DateTime.now(),
          ),
        ],
      );
      return LeaderboardCubit(mockStore);
    },
    act: (cubit) => cubit.load(),
    expect: () => [
      const LeaderboardState(loading: true, entries: []),
      isA<LeaderboardState>().having((s) => s.entries.first.name, 'entry name', 'Naz'),
    ],
    verify: (_) {
      verify(() => mockStore.topList()).called(1);
    },
  );


  blocTest<LeaderboardCubit, LeaderboardState>(
    'addScore adds entry and reloads list',
    build: () {
      when(() => mockStore.add(any())).thenAnswer((_) async {});
      when(() => mockStore.topList()).thenAnswer((_) async => [
        LeaderboardEntry(
          name: 'Player',
          score: 50,
          total: 100,
          createdAt: DateTime.now(),
        ),
      ]);
      return LeaderboardCubit(mockStore);
    },
    act: (cubit) => cubit.addScore('', 50, 100),
    expect: () => [
      const LeaderboardState(loading: true, entries: []),
      isA<LeaderboardState>().having((s) => s.entries.first.name, 'entry name', 'Player'),
    ],
    verify: (_) {
      verify(() => mockStore.add(any())).called(1);
      verify(() => mockStore.topList()).called(1);
    },
  );

}
