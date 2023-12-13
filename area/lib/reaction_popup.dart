import 'package:flutter/material.dart';
import 'dart:async';

class GenericDialog {
  static Future<List<String?>> show(BuildContext context, List<String> inputFields, String text) async {
    Completer<List<String?>> completer = Completer<List<String?>>();

    List<TextEditingController> controllers = [];
    List<String?> inputValues = [];

    for (int i = 0; i < inputFields.length; i++) {
      controllers.add(TextEditingController());
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * inputFields.length * 0.08,
            child: Column(
              children: List.generate(inputFields.length, (index) {
                return TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(labelText: inputFields[index]),
                );
              }),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
                completer.complete(null);
              },
            ),
            TextButton(
              child: Text('Valider'),
              onPressed: () {
                for (int i = 0; i < inputFields.length; i++) {
                  inputValues.add(controllers[i].text);
                }

                Navigator.of(context).pop();
                completer.complete(inputValues);
              },
            ),
          ],
        );
      },
    );

    return completer.future;
  }
}
