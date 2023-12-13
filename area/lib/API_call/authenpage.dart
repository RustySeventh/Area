import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/API_call.dart';
import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';
import 'package:flutter_responsive_login_ui/Connexion/registration_screen.dart';
import 'package:flutter_responsive_login_ui/homepage.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';
import 'package:flutter_responsive_login_ui/res/my_theme.dart';
import 'package:flutter_responsive_login_ui/responsive/CustomDrawer.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/services/service_youtube.dart';
import 'package:flutter_responsive_login_ui/reaction_query.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/globals.dart';
import 'package:flutter_responsive_login_ui/API_call/API_call.dart';
import 'package:flutter_responsive_login_ui/API_call/Auth.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'dart:convert';

class authenpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      initialRoute: '/',
      onGenerateRoute: (settings) {
        // Define a route handler for the callback URI
        if (settings.name == '/callback') {
          // Extract the callback URI from the settings
          final callbackUri = Uri.parse(settings.arguments as String);

          print('In authenpage');
          // Handle the callback URI and exchange the authorization code for tokens
          handleSpotifyAuthCallback(callbackUri).then((response) {
            if (response.statusCode == 200) {
              // Successfully obtained access token and refresh token
              var jsonResponse = json.decode(response.body);
              String accessToken = jsonResponse['access_token'];
              String refreshToken = jsonResponse['refresh_token'];

              // You can now use the access token to make authorized requests to the Spotify API.
            } else {
              // Handle error, e.g., print(response.body)
            }
          }).catchError((error) {
            // Handle any errors that occurred during the request
          });
        }
      },
    );
  }
}
