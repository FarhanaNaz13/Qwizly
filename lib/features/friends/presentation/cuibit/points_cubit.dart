import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quizz_app/features/friends/domain/repository/points_repository.dart';

class PointsCubit extends Cubit<int> {
  final PointsRepository _repo;

  PointsCubit(this._repo) : super(_repo.points);

  void addPoints(int value) {
    _repo.addPoints(value);
    emit(_repo.points);
  }
}
