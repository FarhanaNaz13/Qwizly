import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/features/home/presentation/screens/cubit/featured_quiz_cubit.dart';
import 'package:quizz_app/resource/assets.gen.dart';
import '../../../../quizz/presentation/bloc/cubit/quiz_cubit.dart';

class FeaturedQuizCard extends StatelessWidget {
  final String dayName;
  const FeaturedQuizCard({super.key, required this.dayName});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FeaturedQuizCubit>().state;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 250,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBackgroundLayer(color: Colors.green, offset: 0),
            _buildBackgroundLayer(color: Colors.purple, offset: 15),
            _buildMainCard(
              context: context,
              category: StringRes.generalKnowledge,
              totalTimeMin: state.totalTimeMin,
              totalQuestions: state.totalQuestions,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundLayer({required Color color, required double offset}) {
    return Positioned(
      top: offset,
      left: 0,
      right: 0,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard({
    required BuildContext context,
    required String category,
    required int totalTimeMin,
    required int totalQuestions,
  }) {
    return Positioned(
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
            _buildHeaderChips(category, totalTimeMin),
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
            Text(
              "$totalQuestions ${StringRes.quizzes}",
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            _buildFooterRow(context, category),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderChips(String category, int totalTimeMin) {
    return Row(
      children: [
        _buildChip(label: category, bgColor: Colors.red[100]),
        const SizedBox(width: 8),
        _buildChip(
          label: "$totalTimeMin ${StringRes.min}",
          bgColor: Colors.grey[300],
        ),
        const Spacer(),
        const Icon(Icons.close, color: Colors.white),
      ],
    );
  }

  Widget _buildFooterRow(BuildContext context, String category) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(QuizzAsset.icons.avatar.avatar.path),
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
    );
  }

  Widget _buildChip({required String label, Color? bgColor}) {
    return Chip(
      label: Text(label),
      labelStyle: const TextStyle(fontSize: 12, color: AppColors.kBlackColor),
      backgroundColor: bgColor,
      padding: EdgeInsets.zero,
    );
  }
}
