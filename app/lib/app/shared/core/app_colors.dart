import 'package:flutter/material.dart';

class AppColors {
  static Map<int, Color> _primary = {
    50: Color.fromRGBO(255, 185, 22, .1),
    100: Color.fromRGBO(255, 185, 22, .2),
    200: Color.fromRGBO(255, 185, 22, .3),
    300: Color.fromRGBO(255, 185, 22, .4),
    400: Color.fromRGBO(255, 185, 22, .5),
    500: Color.fromRGBO(255, 185, 22, .6),
    600: Color.fromRGBO(255, 185, 22, .7),
    700: Color.fromRGBO(255, 185, 22, .8),
    800: Color.fromRGBO(255, 185, 22, .9),
    900: Color.fromRGBO(255, 185, 22, 1),
  };
  static Map<int, Color> _yellowAlternative = {
    50: Color.fromRGBO(255, 207, 48, .1),
    100: Color.fromRGBO(255, 207, 48, .2),
    200: Color.fromRGBO(255, 207, 48, .3),
    300: Color.fromRGBO(255, 207, 48, .4),
    400: Color.fromRGBO(255, 207, 48, .5),
    500: Color.fromRGBO(255, 207, 48, .6),
    600: Color.fromRGBO(255, 207, 48, .7),
    700: Color.fromRGBO(255, 207, 48, .8),
    800: Color.fromRGBO(255, 207, 48, .9),
    900: Color.fromRGBO(255, 207, 48, 1),
  };

  static MaterialColor primary = MaterialColor(0xFFFFA600, _primary);
  static MaterialColor yellowAlternative =
      MaterialColor(0xFFffcf30, _yellowAlternative);

  static Color black = Color(0xFF222228);
  static Color grey = Color(0xFF57575A);
  static Color white = Color(0xFFFFFFFF);
  static Color red = Color(0xFFFF0000);
  static Color secondary = Color(0xFFFFC400);
  static Color alternative = Color(0xFFA3A3A2);
  static Color yellow = Color(0xFFFFFF00);
  static Color darkred = Color(0xFF470800);
  static Color yellow2 = Color(0xFFf0c103);
  static Color orange = Color(0xFFc75400);
}
