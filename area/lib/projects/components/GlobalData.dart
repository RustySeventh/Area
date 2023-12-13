import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';

class GlobalData {

  static final GlobalData _instance = GlobalData._internal();
  List<Trigger> triggers = [];

  factory GlobalData() {
    return _instance;
  }

  GlobalData._internal();


  void addTrigger(Trigger newTrigger) {
    triggers.add(newTrigger);
  }

  void removeTrigger(int id) {
    triggers.removeWhere((trigger) => trigger.id == id);
  }

  void updateTrigger(Trigger newTrigger) {
    int index = triggers.indexWhere((trigger) => trigger.id == newTrigger.id);
    triggers[index] = newTrigger;
  }

  void clearTriggers() {
    triggers.clear();
  }

  Future<void> initTriggers(BuildContext context) async {
    String response = await call_user_data(context);

    try {
      List<dynamic> jsonList = json.decode(response);

      List<Trigger> parsedTriggers = jsonList.map((jsonTrigger) {
        return Trigger(
          id: jsonTrigger['id'],
          action: TriggerAction.fromJson(jsonTrigger['action']),
          reaction: Reaction.fromJson(jsonTrigger['reaction']),
        );
      }).toList();

      triggers = parsedTriggers;
    } catch (e) {
      // Gérer les erreurs de décodage JSON
      print('Erreur lors de la conversion de la réponse JSON : $e');
    }
  }

  void printTrigger(int index) {
    if (triggers.isNotEmpty) {
      Trigger trigger = triggers[index];
      print("GlobalData triggers:");
      print("Trigger ID: " + trigger.id.toString());
      print("Action Name: " + trigger.action.name);
      print("Action Active: " + trigger.action.active.toString());
      print("Reaction Name: " + trigger.reaction.name);
      print("End of GlobalData triggers");
    } else {
      print("No triggers available.");
    }
  }

  int getLength() {
    print("triggers.length: " + triggers.length.toString());
    return triggers.length;
  }

  bool isInit() {
    return triggers.isNotEmpty;
  }

  List<Trigger> getTriggers() {
    return triggers;
  }
}
