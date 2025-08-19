import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/core/utils/constant/app_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const NextButton({
    super.key,
    required this.onPressed,
    this.label = StringRes.next,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.purple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
