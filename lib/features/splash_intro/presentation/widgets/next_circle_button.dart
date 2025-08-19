import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class NextCircleButton extends StatelessWidget {
  final Animation<double> progressAnimation;
  final VoidCallback onNext;

  const NextCircleButton({
    super.key,
    required this.progressAnimation,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNext,
      child: SizedBox(
        width: 70,
        height: 70,
        child: AnimatedBuilder(
          animation: progressAnimation,
          builder: (_, __) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: progressAnimation.value,
                    strokeWidth: 6,
                    color: AppColors.purple,
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.purple.withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
