import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const Tag(
      {super.key,
      required this.text,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
