import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class AppFilledButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const AppFilledButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 48,
    this.borderRadius = 12,
    this.backgroundColor = AppColors.purple,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
