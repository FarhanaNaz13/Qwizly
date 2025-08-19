import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class LeaderboardToggle extends StatelessWidget {
  const LeaderboardToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purpleCom[300]!),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  StringRes.weekly,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  StringRes.allTime,
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
