import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/features/quizz/presentation/widgets/quiz_widgets/tag.dart';

class CategoryTags extends StatelessWidget {
  final String category;

  const CategoryTags({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Tag(text: category, color: Colors.red.shade50, textColor: Colors.red),
        const SizedBox(width: 8),
        Tag(
            text: StringRes.challenge,
            color: Colors.grey.shade200,
            textColor: Colors.black87),
      ],
    );
  }
}
