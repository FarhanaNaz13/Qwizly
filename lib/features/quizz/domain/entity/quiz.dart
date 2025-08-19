import 'package:flutter/material.dart';

class Quiz {
  final String title;
  final int totalQuizzes;
  final String iconAsset;
  final Color iconBackground;
  final int participants;

  const Quiz({
    required this.title,
    required this.totalQuizzes,
    required this.iconAsset,
    required this.iconBackground,
    required this.participants,
  });
}