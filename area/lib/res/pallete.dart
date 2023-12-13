import 'package:flutter/material.dart';

class Pallete {
  static const Color backgroundColor = Color.fromRGBO(24, 24, 32, 1);
  static const Color gradient1 = Color.fromRGBO(187, 63, 221, 1);
  static const Color gradient2 = Color.fromRGBO(251, 109, 169, 1);
  static const Color gradient3 = Color.fromRGBO(255, 159, 124, 1);
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);
  static const Color whiteColor = Colors.white;
  static const Color transparentColor = Colors.transparent;
  static const Color blackColor = Colors.black;
  static MaterialColor orangeColor = MaterialColor(
    0xFFFFA500,
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(0xFFFFA500),
      600: Color(0xFFFFA100),
      700: Color(0xFFFF9900),
      800: Color(0xFFFF9100),
      900: Color(0xFFFF8500),
    },
  );
}
