import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';
import 'package:http/http.dart' as http;

Future<void> registerUser(String name, String email, String password) async {
  const String apiUrl = "https://127.0.0.1:8080/api/register"; // API endpoint

  print('In login name: $name');
  print('In login email: $email');
  print('In login password: $password');
  final response = await http.post(
    Uri.parse(apiUrl),
      body: {
        'username': name,
        'email': email,
        'password': password,
      },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('User logged in');
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login user');
  }
}
