import 'package:flutter/material.dart';

class ThemeConfig {
  ThemeConfig._();

  static ThemeData get theme => ThemeData(
        useMaterial3: false,
        primaryColorLight: Color(0xffABC8F7),
        primaryColor: Color(0xff5C77CE),
      );

  // Gradients
  static const List<Color> greenGradient = [
    Color(0xFF63B5AF),
    Color(0xFF438883)
  ];
  static const List<Color> greyGradient = [
    Color(0xFFB5B5B5),
    Color(0xFF7F7F7F)
  ];
  // Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color iceWhite = Color(0xFFEEF8F7);
  static const Color darkGrey = Color(0xFF444444);
  static const Color grey = Color(0xFF666666);
  static const Color lightGrey = Color(0xFFC2C2C2);
  static const Color greenOne = Color(0xFF63B5AF);
  static const Color greenTwo = Color(0xFF438883);
}
