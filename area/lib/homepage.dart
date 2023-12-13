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
import 'package:flutter_responsive_login_ui/API_call/API_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return  MainView(pages: [
      const Introduction(),
      ProjectsView(),
      AddServicePage(),
    ],
    bottomNavigationBar: BottomNavBar());
  }
}

