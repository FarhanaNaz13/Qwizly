import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/core/utils/constant/constant.dart';
import 'package:quizz_app/resource/assets.gen.dart';
import '../../../../quizz/presentation/bloc/cubit/quiz_cubit.dart';

class FeaturedQuizCard extends StatelessWidget {
  final String dayName;
  const FeaturedQuizCard({super.key, required this.dayName});

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.watch<QuizCubit>();
    final quizzes = quizCubit.state.allQuestions;
    final category = StringRes.generalKnowledge;
    final filteredQuizzes =
        quizzes.where((q) => q.category == category).toList();

    final totalQuestions = filteredQuizzes.length;
    final totalTimeSec = totalQuestions * Constant.perQuestionSeconds;
    final totalTimeMin = (totalTimeSec / Constant.sixty).ceil();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 250,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.4 * 255).round()),
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Chip(
                          label: Text(category),
                          labelStyle: const TextStyle(
                              fontSize: 12, color: AppColors.kBlackColor),
                          backgroundColor: Colors.red[100],
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(width: 8),
                        Chip(
                          label: Text("$totalTimeMin ${StringRes.min}"),
                          labelStyle: const TextStyle(
                              fontSize: 12, color: AppColors.kBlackColor),
                          backgroundColor: Colors.grey[300],
                          padding: EdgeInsets.zero,
                        ),
                        const Spacer(),
                        const Icon(Icons.close, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$dayName ${StringRes.quiz}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("$totalQuestions ${StringRes.quizzes}",
                        style: const TextStyle(color: Colors.white70)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              AssetImage(QuizzAsset.icons.avatar.avatar.path),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            StringRes.defaultShareMsg,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.purple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            context.read<QuizCubit>().start(category: category);
                            context.push(RoutePath.quizz);
                          },
                          child: const Text(
                            StringRes.startNow,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
