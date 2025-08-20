import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/features/core/res/string_res.dart';

import 'package:quizz_app/features/core/router/router_path.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class AnimatedPlayAgainButton extends StatefulWidget {
  const AnimatedPlayAgainButton({super.key});

  @override
  State<AnimatedPlayAgainButton> createState() =>
      _AnimatedPlayAgainButtonState();
}

class _AnimatedPlayAgainButtonState extends State<AnimatedPlayAgainButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _birdRotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _birdRotationAnimation = Tween<double>(begin: -0.1, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(RoutePath.quizCategory);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _buttonScaleAnimation.value,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: Transform.rotate(
                angle: _birdRotationAnimation.value,
                child: Image.asset(
                  QuizzAsset.icons.avatar.flappyPurple.path,
                  height: 40,
                  width: 40,
                ),
              ),
              label: const Text(
               StringRes.playAgain,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.kOrangeDashboard,
                ),
              ),
              onPressed: () {
                context.go(RoutePath.quizCategory);
              },
            ),
          );
        },
      ),
    );
  }
}
