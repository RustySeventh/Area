import 'package:flutter/material.dart';

class CustomButton {
  final String boxContainer;
  final String boxContent;
  final Future<void> Function() onPressed;

  CustomButton({
    required this.boxContainer,
    required this.boxContent,
    required this.onPressed,
  });
}