import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/action_bodies.dart';
import 'package:flutter_responsive_login_ui/action_buildAppBar.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';

class ActionPage extends StatefulWidget {
  final String type;
  final GlobalData globalTriggers;
  final Trigger trigger;

  const ActionPage({Key? key, required this.type, required this.globalTriggers, required this.trigger}) : super(key: key);

  @override
  _ActionPageState createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  late String type;
  late GlobalData globalTriggers;
  late Trigger trigger;
  @override
  void initState() {
    super.initState();
    type = widget.type;
    globalTriggers = widget.globalTriggers;
    trigger = widget.trigger;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    double buttonHeight =
        screenHeight ?? 0.0; // Utilisez 0.0 si screenHeight est null
    buttonHeight *= 0.025; // Multipliez la hauteur par 0.1
    double buttonWidth =
        screenWidth ?? 0.0; // Utilisez 0.0 si screenWidth est null
    buttonWidth *= 0.3; // Multipliez la largeur par 0.8
    switch (type) {
      case 'youtube':
        return Scaffold(
          appBar: buildAppBar(context, 'Youtube'),
          body: bodyYoutube(context, buttonWidth, buttonHeight, globalTriggers, trigger),
        );
      case 'discord':
        return Scaffold(
          appBar: buildAppBar(context, 'Discord'),
          body: bodyDiscord(context, buttonWidth, buttonHeight, globalTriggers, trigger),
        );
      case 'meteo':
        return Scaffold(
          appBar: buildAppBar(context, 'Météo'),
          body: bodyMeteo(context, buttonWidth, buttonHeight, globalTriggers, trigger),
        );
      case 'timer':
        return Scaffold(
          appBar: buildAppBar(context, 'Minuteur'),
          body: bodyTimer(context, buttonWidth, buttonHeight, globalTriggers, trigger),
        );
      case 'devises':
        return Scaffold(
          appBar: buildAppBar(context, 'Devises'),
          body: bodyDevise(context, buttonWidth, buttonHeight, globalTriggers, trigger),
        );
      default:
        return Scaffold(
          appBar: buildAppBar(context, 'Heure'),
          body: bodyInconnu,
        );
    }
  }
}
