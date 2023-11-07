import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  const TextWidget({super.key, required this.text, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
