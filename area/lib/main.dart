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
import 'package:flutter_responsive_login_ui/API_call/Auth.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/splash/splash_view.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/api': (context) => Api_Page(),
        '/menu': (context) => const HomePage(),
      },
    );
  }
}
