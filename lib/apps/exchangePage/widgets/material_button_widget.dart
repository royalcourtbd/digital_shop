import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final double minWidth;
  final Color textColor;
  final Color backgroundColor;
  final String text;

  const MaterialButtonWidget({
    Key? key,
    required this.onPressed,
    this.minWidth = 90,
    this.textColor = Colors.white,
    required this.text,
    this.backgroundColor = const Color(0xFF286090),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: textColor,
      minWidth: minWidth,
      height: 35,
      color: backgroundColor,
      child: AutoSizeText(text),
    );
  }
}
