import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/home/presentation/screens/widgets/featured_quiz_card.dart';

class QuizHeader extends StatelessWidget {
  final String dayName;
  const QuizHeader({super.key, required this.dayName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            color: Theme.of(context).cardColor,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 240),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringRes.quizzes,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  ),
                  icon: const Icon(Icons.add, size: 18, color: Colors.white),
                  label: const Text(StringRes.quizCode,
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 60,
          child: FeaturedQuizCard(dayName: dayName),
        ),
      ],
    );
  }
}
