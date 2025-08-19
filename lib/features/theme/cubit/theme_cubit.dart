import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/keys.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static final String _key = KeyConstant.themeMode;
  final Box _box;

  ThemeCubit(this._box) : super(_loadInitialTheme(_box));

  static ThemeMode _loadInitialTheme(Box box) {
    final stored = box.get(_key, defaultValue: StringRes.system) as String;
    switch (stored) {
      case StringRes.dark:
        return ThemeMode.dark;
      case StringRes.light:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void toggleTheme() {
    final newMode = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    emit(newMode);
    _box.put(_key, newMode == ThemeMode.dark ? StringRes.dark : StringRes.light);
  }

  Box get box => _box;

  String get themeString => switch (state) {
    ThemeMode.dark => StringRes.dark,
    ThemeMode.light => StringRes.light,
    ThemeMode.system => StringRes.system,
  };
}
