import 'package:flutter/material.dart';
import 'package:quizz_app/features/quizz/presentation/bloc/cubit/quiz_state.dart';

import 'package:quizz_app/resource/assets.gen.dart';

class QuizHeader extends StatefulWidget {
  final QuizState state;

  const QuizHeader({required this.state});

  @override
  State<QuizHeader> createState() => _QuizHeaderState();
}

class _QuizHeaderState extends State<QuizHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant QuizHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.index != widget.state.index) {
      _controller.forward(from: 0); // trigger flight on question change
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final finalOffset =
        8.0 + ('Q${widget.state.index + 1}/${widget.state.total}'.length * 10);

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Q${widget.state.index + 1}/${widget.state.total}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(width: 32),
              ],
            ),
            if (widget.state.timer != null)
              Text(
                '⏳ ${widget.state.timer}s',
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            double xPos = screenWidth * (1 - _animation.value) * 0.8;
            if (_animation.isCompleted) xPos = finalOffset;

            return Positioned(
              top: -4,
              left: xPos,
              child: Image.asset(
                QuizzAsset.icons.avatar.flappyPurple.path,
                width: 28,
                height: 28,
              ),
            );
          },
        ),
      ],
    );
  }
}
