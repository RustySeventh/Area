import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/action_buildAppBar.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/ifthenwill_body.dart';
import 'package:flutter_responsive_login_ui/ifthenwill_customButton.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';

class ResumeData extends StatelessWidget {
  final String resumeData;

  ResumeData({required this.resumeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résumé des Données'),
      ),
      body: Center(
        child: Text(
          resumeData,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class IfThenWillPage extends StatefulWidget {
  final GlobalData globalTriggers;
  final Trigger trigger;
  const IfThenWillPage({Key? key, required this.globalTriggers, required this.trigger}) : super(key: key);

  @override
  _IfThenWillPageState createState() => _IfThenWillPageState();
}

class _IfThenWillPageState extends State<IfThenWillPage> {
  late GlobalData globalTriggers;
  late Trigger trigger;
  late List<CustomButton> customButtons;
  @override
  void initState() {
    super.initState();
    globalTriggers = widget.globalTriggers;
    trigger = widget.trigger;
    customButtons = [
      CustomButton(
        boxContainer: 'If',
        boxContent: trigger.action.name,
        onPressed: () async {
          await handleIfButtonPress(); // Votre logique asynchrone ici
        },
      ),
      CustomButton(
        boxContainer: 'Then',
        boxContent: trigger.reaction.name,
        onPressed: () async {
          await handleThenButtonPress(); // Votre logique asynchrone ici
        },
      ),
    ];
  }

  Future<void> handleIfButtonPress() async {
    // Votre logique ici
  }

  Future<void> handleThenButtonPress() async {
    // Votre logique ici
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: buildAppBar(context, 'Résumé du service'),
        body: buildIfthenwill(context, customButtons, globalTriggers, trigger)
    );
  }
}