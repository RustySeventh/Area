import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_responsive_login_ui/homepage.dart';

Future<void> loginUser(
    BuildContext context, String email, String password) async {
  const String apiUrl = "http://127.0.0.1:8000/api/login"; // API endpoint

  print('In login email: $email');
  print('In login password: $password');
  final response = await http.post(
    Uri.parse(apiUrl),
    body: {
      'email': email,
      'password': password,
    },
  );
  response.statusCode == 200;

  if (response.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login user');
  }
}
