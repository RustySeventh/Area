import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart';
import 'package:flutter_responsive_login_ui/homepage.dart';
import 'package:flutter_responsive_login_ui/splash/componenets/animated_loading_text.dart';
import 'package:flutter_responsive_login_ui/animated_texts_componenets.dart';
import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 130,height: 130,),
            SizedBox(height: defaultPadding,),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
