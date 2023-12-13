import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/widgets/add_button.dart';
import 'package:flutter_responsive_login_ui/Icons/profil.dart';
import 'package:flutter_responsive_login_ui/reaction_popup.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'dart:convert';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/ifthenwill_page.dart';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';

Widget bodySpotify(BuildContext context, double? screenWidth, double? screenHeight, GlobalData globalTriggers, Trigger trigger) => SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Créer une playlist.',
          onPressed: () async {
            print("creating spotify playlist");
            List<String?> enteredText = await GenericDialog.show(
              context,
              [
                'Nom de la playlist',
                'Description de la playlist',
                'Public (true/false)'
              ],
              'Créer une playlist',
            );
            if (enteredText != null) {
              trigger.reaction.name = "spotify_create_playlist";
              trigger.reaction.data.data["name"] = enteredText[0] ?? '';
              trigger.reaction.data.data["description"] = enteredText[1] ?? '';
              trigger.reaction.data.data["public"] = enteredText[2] ?? '';
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Supprimer une playlist.',
          onPressed: () async {
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Nom de la playlist'],
              'Supprimer une playlist',
            );
            if (enteredText != null) {
              trigger.reaction.name = 'spotify_delete_playlist';
              trigger.reaction.data.data["name"] = enteredText[0] ?? '';
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Passer à la musique suivante.',
          onPressed: () async {
            trigger.reaction.name = 'spotify_next';
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Passer à la musique précédente.',
          onPressed: () async {
            trigger.reaction.name = 'spotify_previous';
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Mettre pause à la lecture.',
          onPressed: () async {
            trigger.reaction.name = 'spotify_pause';
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Reprendre la lecture.',
          onPressed: () async {
            trigger.reaction.name = 'spotify_play';
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Mettre une musique en liste d\'attente.',
          onPressed: () async {
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Nom de la musique'],
              'Mettre une musique en liste d\'attente.',
            );
            if (enteredText != null) {
              trigger.reaction.name = "spotify_add_to_queue";
              trigger.reaction.data.data["track"] = enteredText[0] ?? '';
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
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
          buttonText: 'Envoyer un message privé.',
          onPressed: () async {
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['ID de la personne', 'Contenu du message'],
              'Envoyer un message privé.',
            );
            if (enteredText != null) {
              trigger.reaction.name = "discord_send_private_message";
              trigger.reaction.data.data["user"] = enteredText[0] ?? '';
              trigger.reaction.data.data["message"] = enteredText[1] ?? '';
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 40),
        CheckButton(
          display: CheckDisplay.Text,
          buttonText: 'Envoyer un message dans un channel.',
          onPressed: () async {
            List<String?> enteredText = await GenericDialog.show(
              context,
              ['Webhook URL'],
              'Envoyer un message dans un channel.',
            );
            if (enteredText != null) {
              trigger.reaction.name = "discord_send_message";
              trigger.reaction.data.data["webhook URL"] = enteredText[0] ?? '';
            } else {
              print("Dialog was canceled (Annuler button pressed)");
            }
          },
          redirectFunction: (context) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => IfThenWillPage(
                  globalTriggers: globalTriggers,
                  trigger: trigger,
                ),
              ),
            );
          },
        ),
      ],
    ),
  ),
);
