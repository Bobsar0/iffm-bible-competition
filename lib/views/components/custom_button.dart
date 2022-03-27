import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
      this.onPressed,
      required this.text,
      this.backgroundColor = Colors.green,
      this.textColor = Colors.white,
      this.height = 60,
      this.width,
      this.fontSize = 18})
      : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width * 0.50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
