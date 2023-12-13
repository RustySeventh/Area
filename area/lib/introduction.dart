import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';
import 'package:flutter_responsive_login_ui/res/my_theme.dart';
import 'package:flutter_responsive_login_ui/responsive/navbar.dart';
import 'package:flutter_responsive_login_ui/intro_body.dart';
import 'package:flutter_responsive_login_ui/side_menu_button.dart';
import 'package:flutter_responsive_login_ui/responsive.dart';
import 'package:flutter_responsive_login_ui/navigation/navigation_bar.dart';
import 'package:flutter_responsive_login_ui/navigation/main_view.dart';
import 'package:flutter_responsive_login_ui/introduction.dart';
import 'package:flutter_responsive_login_ui/projects/project_view.dart';
import 'package:flutter_responsive_login_ui/projects/add_service.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.01,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.02,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.07,
          ),
          const Expanded(
            child: IntroBody(),
          ),
        ],
      ),
    );
  }
}



