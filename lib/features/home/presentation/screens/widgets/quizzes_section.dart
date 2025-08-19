import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_type_widget.dart';


class QuizzesSection extends StatelessWidget {
  const QuizzesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringRes.yourQuizzes,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                TextButton(
                  onPressed: () {
                    context.go(RoutePath.quizCategory);
                  },
                  child: const Text(StringRes.seeAll),
                ),
              ],
            ),
            QuizTypeWidget(color: AppColors.gray[300]),
          ],
        ),
      ),
    );
  }
}
