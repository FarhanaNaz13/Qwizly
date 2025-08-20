import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';

class NameInputField extends StatelessWidget {
  final TextEditingController controller;

  const NameInputField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: StringRes.enterName,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }
}
