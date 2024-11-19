import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;
  SmallText(
      {super.key,
        this.color = const Color(0xFF332d2b),
        this.size = 12,
        this.height = 1.2,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Schyler',
        fontSize: size,
        height: height,
      ),
    );
  }
}
