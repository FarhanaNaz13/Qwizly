import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class LatexText extends StatelessWidget {
  final String content;
  final TextStyle? style;

  const LatexText(this.content, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'\$\$(.*?)\$\$');
    final spans = <InlineSpan>[];
    int lastEnd = 0;

    if (!content.contains(r'$') && !content.contains(r'\\')) {
      return Text(
        content,
        style: style,
        softWrap: true,
        overflow: TextOverflow.visible,
      );
    }

    for (final match in regex.allMatches(content)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: content.substring(lastEnd, match.start),
          style: style,
        ));
      }

      final formula = match.group(1)?.trim() ?? '';
      spans.add(WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Math.tex(
          formula,
          textStyle: style ?? const TextStyle(fontSize: 16),
        ),
      ));

      lastEnd = match.end;
    }

    if (lastEnd < content.length) {
      spans.add(TextSpan(
        text: content.substring(lastEnd),
        style: style,
      ));
    }

    return RichText(
      text: TextSpan(children: spans),
      softWrap: true,
    );
  }
}
