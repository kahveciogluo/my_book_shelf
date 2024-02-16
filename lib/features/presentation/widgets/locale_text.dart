import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  const LocaleText(
      {super.key,
      required this.text,
      this.style,
      this.textAlign,
      this.maxLines,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.locale,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
