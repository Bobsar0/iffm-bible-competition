import 'package:flutter/material.dart';

ButtonStyle elevatedButtonStyle({double? width, double? height, Color? color}) {
  return ElevatedButton.styleFrom(
    primary: color,
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: Size(width ?? 100, height ?? 50),
  );
}
