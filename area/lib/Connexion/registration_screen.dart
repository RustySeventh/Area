import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';
import 'package:flutter_responsive_login_ui/widgets/login_field.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';
import 'package:flutter_responsive_login_ui/cubit/qbite_email.dart';
import 'package:flutter_responsive_login_ui/cubit/qbite_password.dart';
import 'package:flutter_responsive_login_ui/core/check_register.dart';
import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  String name = '';
  final passwordCubit = PasswordCubit();
  final emailCubit = EmailCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              LoginField(
                hintText: 'Name',
                onChanged: (value) {
                  name = value;
                },
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Email',
                onChanged: (value) {
                  emailCubit.updateEmail(value);
                },
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                onChanged: (value) {
                  passwordCubit.updatePassword(value);
                },
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  _performRegistration(context);
                },
                buttonText: 'Sign In',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performRegistration(BuildContext context) async {
    await call_register(
        context, name, emailCubit.state, passwordCubit.state);


  }
}
