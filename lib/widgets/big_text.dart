import 'package:flutter/material.dart';
import 'package:testtt/utils/dimensions.dart';
// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {super.key,
        this.color = const Color(0xFF332d2b),
        this.overflow = TextOverflow.ellipsis,
        this.size = 0,
        required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: 'Schyler',
        fontSize: size==0?Dimensions.font20:size,
      ),
    );
  }
}
