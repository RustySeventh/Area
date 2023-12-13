import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';
import 'package:flutter_responsive_login_ui/responsive/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_responsive_login_ui/widgets/avatar_socials.dart';
import 'package:flutter_responsive_login_ui/Icons/profil.dart';
import 'package:flutter_responsive_login_ui/reaction_page.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:intl/intl.dart';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';

class CustomButton {
  final String imagePath;
  final String disconnectedPath;
  final Function(BuildContext context) onPressed;

  CustomButton({
    required this.imagePath,
    required this.disconnectedPath,
    required this.onPressed,
  });
}

class CirclePage extends StatelessWidget {
  final GlobalData globalTriggers;
  final Trigger trigger;

  CirclePage({required this.globalTriggers, required this.trigger}) {
    customButtons = [
      CustomButton(
        imagePath: 'assets/images/spotify.jpg',
        disconnectedPath: 'assets/images/disconnected.png',
        onPressed: (BuildContext context) {
          call_spotify_auth(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReactionPage(type: 'spotify', globalTriggers: globalTriggers, trigger: trigger),
            ),
          );
        },
      ),
      CustomButton(
        imagePath: 'assets/images/discord.png',
        disconnectedPath: 'assets/images/disconnected.png',
        onPressed: (BuildContext context) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReactionPage(type: 'discord', globalTriggers: globalTriggers, trigger: trigger),
            ),
          );
        },
      ),
    ];
  }

  late List<CustomButton> customButtons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir sa réaction'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 16.0,
            runSpacing: 16.0,
            children: customButtons.map((button) {
              return AvatarWidget.clickable_service_avatar(
                button.imagePath,
                button.disconnectedPath,
                () => button.onPressed(context),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

