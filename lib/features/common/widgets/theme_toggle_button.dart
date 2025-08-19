import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/theme/cubit/theme_cubit.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ElevatedButton.icon(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          icon: Icon(
            themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
          ),
          label: Text(
            themeMode == ThemeMode.dark ? StringRes.dark : StringRes.light,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: themeMode == ThemeMode.dark
                ? Colors.grey[850]
                : Colors.orange,
          ),
        );
      },
    );
  }
}
