import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onSkip;
  final VoidCallback? onContinue;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onSkip,
    this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onContinue != null) onContinue!();
          },
          child: const Text("Continue"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSkip();
          },
          child: const Text("Skip"),
        ),
      ],
    );
  }

  static Future<void> show(
      BuildContext context, {
        required String title,
        required String message,
        required VoidCallback onSkip,
        VoidCallback? onContinue,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ConfirmationDialog(
        title: title,
        message: message,
        onSkip: onSkip,
        onContinue: onContinue,
      ),
    );
  }
}
