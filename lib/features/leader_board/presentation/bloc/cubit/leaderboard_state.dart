import 'package:equatable/equatable.dart';
import 'package:quizz_app/features/leader_board/domain/entity/leaderboard_entry.dart';

class LeaderboardState extends Equatable {
  final bool loading;
  final List<LeaderboardEntry> entries;
  const LeaderboardState({this.loading = true, this.entries = const []});
  LeaderboardState copyWith({bool? loading, List<LeaderboardEntry>? entries}) =>
      LeaderboardState(loading: loading ?? this.loading, entries: entries ?? this.entries);
  @override
  List<Object?> get props => [loading, entries];
}
