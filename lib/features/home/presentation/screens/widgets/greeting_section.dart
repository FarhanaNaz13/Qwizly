import 'package:flutter/material.dart';
import 'package:quizz_app/features/core/res/string_res.dart';
import 'package:quizz_app/resource/assets.gen.dart';
class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final greeting = _getGreeting(now);
    final icon = _getGreetingIcon(now);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    Icon(icon, color: Colors.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      greeting,
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

  String _getGreeting(DateTime now) {
    final hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  IconData _getGreetingIcon(DateTime now) {
    final hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return Icons.wb_sunny;
    } else if (hour >= 12 && hour < 17) {
      return Icons.wb_sunny_outlined;
    } else {
      return Icons.nights_stay;
    }
  }
}
