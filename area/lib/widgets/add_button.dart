import 'package:flutter/material.dart';

enum CheckDisplay {
  Icon,
  Text,
}

class CheckButton extends StatelessWidget {
  final CheckDisplay display;
  final Future<void> Function() onPressed;
  final Function(BuildContext) redirectFunction;
  final String buttonText;
  final double? buttonWidth;
  final double? buttonHeight;

  CheckButton({
    required this.display,
    required this.onPressed,
    required this.redirectFunction,
    required this.buttonText,
    this.buttonWidth,
    this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = buttonWidth ?? (screenWidth - 2 * 20); // Utilisez la largeur spécifiée ou la largeur de l'écran - 2 * padding
    double targetHeight = buttonHeight ?? double.infinity; // Utilisez la hauteur spécifiée ou une hauteur infinie par défaut

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: targetWidth,
        maxHeight: targetHeight,
      ),
      child: ElevatedButton(
        onPressed: () async {
          await onPressed();
          await redirectFunction(context);
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0x97191A20), // Couleur du bouton (noir)
          padding: EdgeInsets.all(20), // Padding uniforme autour du bouton
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: Colors.purple.shade900.withOpacity(1), // Couleur de l'ombre du bouton (dégradé de bleu foncé à violet foncé)
          elevation: 8, // Élévation de l'ombre
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: display == CheckDisplay.Icon
                  ? Icon(Icons.check, color: Colors.white) // Icône en blanc
                  : Container(),
            ),
            Expanded(
              child: display == CheckDisplay.Text
                  ? FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    )
                  : Container(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
          ],
        ),
      ),
    );
  }
}
