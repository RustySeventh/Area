import 'package:flutter/material.dart';

Widget active_inactive(bool switchValue, Function(bool) onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Switch(
        value: switchValue,
        onChanged: onChanged,
        activeColor: Colors.green,
        inactiveThumbColor: Colors.red,
      ),
    ],
  );
}