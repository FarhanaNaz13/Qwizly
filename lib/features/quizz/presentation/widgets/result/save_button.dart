import 'package:flutter/material.dart';
import 'package:quizz_app/features/common/widgets/app_filled_button.dart';
import 'package:quizz_app/features/core/res/string_res.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSave;

  const SaveButton({required this.controller, required this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    return AppFilledButton(
      label: StringRes.saveToLeaderboard,
      onPressed: () {
        if (controller.text.isNotEmpty) {
          onSave(controller.text);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(StringRes.pleaseEnterName)),
          );
        }
      },
    );
  }
}
