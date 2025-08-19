import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/leader_board/data/datasource/leaderboard_store.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';
import 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final LeaderboardStore store;
  LeaderboardCubit(this.store) : super(const LeaderboardState());

  Future<void> load() async {
    emit(state.copyWith(loading: true));
    final list = await store.topList();
    emit(state.copyWith(loading: false, entries: list));
  }

  Future<void> addScore(String name, int score, int total) async {
    await store.add(LeaderboardEntry(
      name: name.trim().isEmpty ? StringRes.player : name.trim(),
      score: score,
      total: total,
      createdAt: DateTime.now(),
    ));
    await load();
  }
}
