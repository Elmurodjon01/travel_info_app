import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  double size;
  final String text;
  final Color textColor;
  ReusableText(
      {this.size = 30, required this.text, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
