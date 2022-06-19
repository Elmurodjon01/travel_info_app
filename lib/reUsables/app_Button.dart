import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/reUsables/intro_nonBoldText.dart';

import '../misc/colors.dart';

class AppButton extends StatelessWidget {
  String? text;
  IconData? icon;
  final Color color;
  final Color backColor;
  double size;
  bool? isIcon;
  final Color borderColor;
  AppButton({Key? key,
   this.isIcon = false,
    this.text= 'hey',
    this.icon,
    required this.color,
    required this.backColor,
    required this.size,
    required this.borderColor,
}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(

      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backColor,
        border: Border.all(color: borderColor,
        width: 1.0,),
      ),
      child: isIcon ==false? Center(child: NonBoldText(text: text!, textColor: color)) :Center(child: Icon(icon, color: color)),
    );
  }
}
