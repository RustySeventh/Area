import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';
import 'package:flutter_responsive_login_ui/widgets/login_field.dart';
import 'package:flutter_responsive_login_ui/widgets/social_button.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';
import 'package:flutter_responsive_login_ui/Connexion/registration_screen.dart';
import 'package:flutter_responsive_login_ui/homepage.dart';
import 'package:flutter_responsive_login_ui/Connexion/forgot_password_screen.dart';
import 'package:flutter_responsive_login_ui/core/check_login.dart';
import 'package:flutter_responsive_login_ui/cubit/qbite_password.dart';
import 'package:flutter_responsive_login_ui/cubit/qbite_email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';

class LoginScreen extends StatelessWidget {
  final passwordCubit = PasswordCubit();
  final emailCubit = EmailCubit();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    void _navigateToSignIn(BuildContext context) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => RegistrationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Modifier cette valeur pour obtenir l'effet de montée
            const end = Offset.zero;
            const curve = Curves.ease;
            const transitionDuration = const Duration(seconds: 1);

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 15),
              LoginField(
                hintText: 'Email',
                onChanged: (value) {
                  emailCubit.updateEmail(value);
                },
              ),
              SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                onChanged: (value) {
                  passwordCubit.updatePassword(value);
                },
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  call_login(context, emailCubit.state, passwordCubit.state);
                },
                buttonText: 'Login',
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Pallete.transparentColor,
                  minimumSize: const Size(200, 40),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text(
                  'Forgot password ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  _navigateToSignIn(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Pallete.transparentColor,
                  minimumSize: const Size(200, 40),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
