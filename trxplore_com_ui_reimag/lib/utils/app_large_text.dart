import 'package:flutter/material.dart';
import '../misc/colors.dart';

class AppLargetext extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppLargetext(
      {Key? key,
      this.size = 30,
      required this.text,
      this.color = AppColors.bigTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
