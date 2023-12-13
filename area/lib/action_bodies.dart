import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/widgets/add_button.dart';
import 'package:flutter_responsive_login_ui/Icons/profil.dart';
import 'package:flutter_responsive_login_ui/reaction_popup.dart';
import 'package:flutter_responsive_login_ui/reaction_query.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'dart:convert';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';

Widget bodyYoutube(BuildContext context, double? screenWidth, double? screenHeight, GlobalData globalTriggers, Trigger trigger) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Nouvelle vidéo.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'yt_new_video',
              active: true,
              data: Data(data: {}),
            );
            print(trigger.action);

            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Mentionnez le youtubeur'],
              'Quand un youtubeur poste une nouvelle vidéo.',
            );
            if (enteredText != null) {
              for (String? text in enteredText) {
                if (text != null) {
                  const key = "channel_name";
                  trigger.action.data!.data![key] = text;
                }
              }
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Nouvel abonnement.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'yt_new_subscription',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'yt_new_video', 'active': true};
            // print(trigger.action);
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Mentionnez la chaîne.'],
              'Quand une personne s\'est abonné.',
            );
            if (enteredText != null) {
              for (String? text in enteredText) {
                if (text != null) {
                  const key = "channel_name";
                  trigger.action.data!.data![key] = text;
                }
              }
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
      ],
    ),
  ),
);

Widget bodyDiscord(BuildContext context, double? screenWidth, double? screenHeight, GlobalData globalTriggers, Trigger trigger) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Nouveau message reçu.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'dscrd_new_message',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'dscrd_new_message', 'active': true};
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Nouvelle notification reçue.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'dscrd_new_notif',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'dscrd_new_notif', 'active': true};
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Nouvelle demande d\'ami reçue.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'dscrd_new_friend',
              active: true,
              data: Data(data: {}),
            );
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
      ],
    ),
  ),
);

Widget bodyMeteo(BuildContext context, double? screenWidth, double? screenHeight, GlobalData globalTriggers, Trigger trigger) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Température supérieure à un nombre.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'weather_comp',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'weather_comp', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Lieu', 'Température'],
              'Comparer les températures.',
            );
            print(enteredText[0]);
            const key = "city";
            trigger.action.data.data![key] = enteredText[0];
            const key2 = "temp";
            trigger.action.data.data![key2] = enteredText[1];
            trigger.action.data.data!["eq"] = 1;
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger : trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Température inférieure à un nombre.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'weather_comp',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'weather_comp', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Lieu', 'Température'],
              'Comparer les températures.',
            );
            const key = "city";
            trigger.action.data!.data![key] = enteredText[0];
            const key2 = "temp";
            trigger.action.data!.data![key2] = enteredText[1];
            trigger.action.data.data!["eq"] = -1;
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Température égale à un nombre.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'weather_comp',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'weather_comp', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Lieu', 'Température'],
              'Comparer les températures.',
            );
            const key = "city";
            trigger.action.data!.data![key] = enteredText[0];
            const key2 = "temp";
            trigger.action.data!.data![key2] = enteredText[1];
            trigger.action.data.data!["eq"] = 0;
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger: trigger)),
            );
          },
        ),
      ],
    ),
  ),
);

Widget bodyTimer(BuildContext context, double? screenWidth, double? screenHeight, GlobalData globalTriggers, Trigger trigger) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Action sur fin du minuteur.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'timer',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'timer', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Entrez le nombre d\'heures', 'Entrez le nombre de minutes', 'Entrez le nombre de secondes', 'Relance auto (true/false)'],
              'Durée du minuteur.',
            );
            print(enteredText);
            const key = "hours";
            trigger.action.data!.data![key] = enteredText[0];
            const key2 = "minutes";
            trigger.action.data!.data![key2] = enteredText[1];
            const key3 = "seconds";
            trigger.action.data!.data![key3] = enteredText[2];
            const key4 = "repeat";
            trigger.action.data!.data![key4] = enteredText[3];
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger : trigger)),
            );
          },
        ),
      ],
    ),
  ),
);

Widget bodyDevise(BuildContext context, double? screenWidth, double? screenHeight, GlobalData globalTriggers, Trigger trigger) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Valeur d\'une devise inférieure à une valeur.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'currency',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'currency', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Devise', 'Valeur à vérifier (en €)'],
              'Vérifier la valeur d\'une devise.',
            );
            print(enteredText);
            const key = "currency_name";
            trigger.action.data!.data![key] = enteredText[0];
            const key2 = "value";
            trigger.action.data!.data![key2] = enteredText[1];
            trigger.action.data.data!["eq"] = -1;
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger : trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Valeur d\'une devise supérieure à une valeur.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'currency',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'currency', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Devise', 'Valeur à vérifier'],
              'Vérifier la valeur d\'une devise.',
            );
            const key = "currency_name";
            trigger.action.data!.data![key] = enteredText[0];
            const key2 = "value";
            trigger.action.data!.data![key2] = enteredText[1];
            trigger.action.data.data!["eq"] = 1;
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger : trigger)),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Valeur d\'une devise égale à une valeur.',
          onPressed: () async {
            trigger.action = TriggerAction(
              name: 'currency',
              active: true,
              data: Data(data: {}),
            );
            // trigger.action = {'name': 'currency', 'active': true};
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Devise', 'Valeur à vérifier'],
              'Vérifier la valeur d\'une devise.',
            );
            print(enteredText);
            const key = "currency_name";
            trigger.action.data!.data![key] = enteredText[0];
            const key2 = "value";
            trigger.action.data!.data![key2] = enteredText[1];
            trigger.action.data.data!["eq"] = 0;
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CirclePage(globalTriggers: globalTriggers, trigger : trigger)),
            );
          },
        ),
      ],
    ),
  ),
);

var bodyInconnu = Center(
  child: Text('Service inconnu'),
);
