import 'package:flutter/material.dart';

class input_text {
  static Widget simple_input({
    double? height,
    double? width,
    TextEditingController? controller,
    int? maxlength,
    required String hintText,
    Function(String)? onTextChanged,
  }) {
    return Container(
      height: height ?? 100,
      width: width ?? 300,
      child: TextField(
        controller: controller,
        maxLength: maxlength,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        onChanged: onTextChanged,
      ),
    );
  }
}

