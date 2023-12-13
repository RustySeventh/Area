import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/ifthenwill_customButton.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/widgets/add_button.dart';
import 'package:flutter_responsive_login_ui/homepage.dart';
import 'dart:convert';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';

Widget summarizeBox(BuildContext context, double width, double height, String boxContainer, String boxContent, Future<void> Function() onPressed) => MouseRegion(
  cursor: SystemMouseCursors.click,
  child: GestureDetector(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF192049).withOpacity(0.6),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Color(0xFF640089).withOpacity(0.6),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
        color: Color(0xFF191A20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            boxContainer,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            boxContent,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white, // Couleur du texte néon
            ),
          ),
        ],
      ),
    ),
  ),
);

Widget buildIfthenwill(BuildContext context, List<CustomButton> buttons, GlobalData globalTriggers, Trigger trigger) => Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 16.0,
        runSpacing: 16.0,
        children: buttons.map((button) {
          return summarizeBox(
            context,
            400.0,
            100.0,
            button.boxContainer,
            button.boxContent,
            button.onPressed,
          );
        }).toList(),
      ),
      SizedBox(height: 40.0), // Placer le SizedBox ici, à l'extérieur du Wrap
      CheckButton(
        display: CheckDisplay.Text,
        buttonText: 'ADD',
        onPressed: () async {
          if (globalTriggers.getLength() == 0) {
            trigger.id = 1;
          } else {
            trigger.id = globalTriggers.getLength() + 1;
          }
          globalTriggers.addTrigger(trigger);
          call_update_triggers(context, globalTriggers.getTriggers());
        },
        redirectFunction: (context) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
        },
        buttonHeight: 50.0,
        buttonWidth: 400.0,
      ),
    ],
  ),
);