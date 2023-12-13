import 'package:flutter/material.dart';

class textElement {
  static Widget buildHeadertext(String title) {
    return Text(
      'Bienvenue sur le service $title',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget description_text(String description, {double? fontSize, TextAlign? textAlign})
  {
    return Text(
      '$description',
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 16,
      ),
    );
  }



}
