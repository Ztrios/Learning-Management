import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlViewerWidget extends StatelessWidget {
  final String content;
  const HtmlViewerWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      extensions: [
        TagExtension(
          tagsToExtend: {"flutter"},
          child: const FlutterLogo(),
        ),
      ],
      style: {
        "p.fancy": Style(
          textAlign: TextAlign.center,
          //padding: const EdgeInsets.all(16),
          backgroundColor: Colors.grey,
          margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
          width: Width(300, Unit.px),
          fontWeight: FontWeight.bold,
        ),
      },
    );
  }
}
