import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/resource/assets.gen.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8),
        color: Theme.of(context).cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      StringRes.greetingsDefault,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  StringRes.defaultUserName,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(QuizzAsset.icons.avatar.user.path),
            ),
          ],
        ),
      ),
    );
  }
}
