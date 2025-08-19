import 'package:injectable/injectable.dart';

@lazySingleton
class PointsRepository {
  int _points = 0;

  int get points => _points;

  void addPoints(int value) {
    _points += value;
  }
}
