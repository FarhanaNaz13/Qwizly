import 'package:flutter/material.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class AnimatedFlappy extends StatefulWidget {
  final double iconSize;
  final TextStyle? textStyle;

  const AnimatedFlappy({
    super.key,
    this.iconSize = 30,
    this.textStyle,
  });

  @override
  State<AnimatedFlappy> createState() =>
      _AnimatedFlappyState();
}

class _AnimatedFlappyState extends State<AnimatedFlappy>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;
  late final Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _rotationAnimation = Tween<double>(begin: -0.05, end: 0.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _bounceAnimation = Tween<double>(begin: 0, end: -5).animate(
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _bounceAnimation.value),
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: child,
          ),
        );
      },
      child: Image.asset(
        QuizzAsset.icons.avatar.flappyPurple.path,
        height: widget.iconSize,
        width: widget.iconSize,
      ),
    );
  }
}
