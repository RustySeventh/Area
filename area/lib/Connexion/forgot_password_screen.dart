import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/homepage.dart';
import 'package:flutter_responsive_login_ui/widgets/gradient_button.dart';
import 'package:flutter_responsive_login_ui/widgets/login_field.dart';
import 'package:flutter_responsive_login_ui/cubit/qbite_email.dart';

class ForgotPasswordPage extends StatelessWidget {
  // const ForgotPasswordPage({Key? key}) : super(key: key);
  final emailCubit = EmailCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset your password'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Reset your',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const Text(
                'password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              LoginField(
                hintText: 'Enter your email',
                onChanged: (value) {
                  emailCubit.updateEmail(value);
                },
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                buttonText: 'Reset password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}