import 'package:flutter/material.dart';

class NonBoldText extends StatelessWidget {
  double size;
  final String text;
  final Color textColor;
  NonBoldText(
      {this.size = 16, required this.text, required this.textColor});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: size,
      ),
    );
  }
}