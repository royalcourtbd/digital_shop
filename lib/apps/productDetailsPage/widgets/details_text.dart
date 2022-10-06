import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  String title;
  DetailsText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 82, 79, 79),
      ),
    );
  }
}
