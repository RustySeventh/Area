import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';

class MyTheme {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: Pallete.backgroundColor,
      backgroundColor: Pallete.backgroundColor,
      primarySwatch: Pallete.orangeColor,
    );
  }
}
