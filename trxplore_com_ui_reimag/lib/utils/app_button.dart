//reusable app button
import 'package:flutter/material.dart';
import 'package:trxplore_com_ui_reimag/utils/app_text.dart';

class AppSquareButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  bool isIcon;
  String? text;
  IconData? icon;
  AppSquareButton({
    Key? key,
    this.icon,
    this.text = '',
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: isIcon
          ? Center(
              child: Icon(
                icon,
                color: color,
              ),
            )
          : Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            ),
    );
  }
}
