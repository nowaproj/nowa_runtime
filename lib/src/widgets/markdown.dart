import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:markdown_widget/widget/markdown.dart';

class Markdown extends StatelessWidget {
  const Markdown(
    this.data, {
    this.style,
    this.selectable = true,
    super.key,
  });

  final String data;
  final TextStyle? style;
  final bool selectable;

  @override
  Widget build(BuildContext context) {
    final markdown = MarkdownWidget(
      data: data,
      selectable: selectable,
    );

    if (style != null) {
      return DefaultTextStyle(style: style!, child: markdown);
    }
    return markdown;
  }
}
