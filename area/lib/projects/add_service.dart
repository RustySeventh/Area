import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/navigation/co_button.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart';
import 'package:flutter_responsive_login_ui/projects/project_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/view model/getx_controllers/projects_controller.dart';
import 'components/title_text.dart';
import 'package:get/get.dart';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalData globalTriggers = GlobalData();
    globalTriggers.initTriggers(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16.0),
                const TitleText(prefix: 'Ajouter', title: 'des services'),
                const SizedBox(height: 16.0),
                const Text(
                  'Ajoutez de nouveaux services pour améliorer votre expérience utilisateur.',
                  style: TextStyle(color: Color.fromARGB(221, 241, 240, 240), fontSize: 19.0),
                ),
                const SizedBox(height: 32.0),
                Column(
                  children: globalTriggers.getTriggers().map((trigger) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BegButton(
                        text: '${trigger.action.name}   --->   ${trigger.reaction.name}',
                        onPressed: () {
                          // Action à effectuer lorsqu'un bouton de trigger est cliqué
                          print('Bouton Trigger ${trigger.id} cliqué.');
                        },
                        showRightIcon: true,
                        onIconPressed: () {
                          // Action à effectuer lorsqu'on clique sur l'icône
                          print('Icône du bouton Trigger ${trigger.id} cliquée.');

                          globalTriggers.removeTrigger(trigger.id);
                          call_update_triggers(context, globalTriggers.getTriggers());
                          print("\n\nRemove service:");
                          call_user_data(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddServicePage()),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 32.0),
                Center(
                  child: Container(
                    width: 200,
                    child: BeginButton(
                      buttonText: 'Ajouter',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProjectsView()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BegButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onIconPressed;
  final double? width;
  final bool showRightIcon;

  BegButton({
    required this.text,
    required this.onPressed,
    this.onIconPressed,
    this.width,
    this.showRightIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    double buttonWidth = width ?? MediaQuery.of(context).size.width * 0.9;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: buttonWidth,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.blue, offset: Offset(0, -1), blurRadius: 5),
            BoxShadow(color: Colors.red, offset: Offset(0, 1), blurRadius: 5),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.pink, Colors.blue.shade900],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: showRightIcon ? TextAlign.start : TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (showRightIcon)
              GestureDetector(
                onTap: onIconPressed ?? () {},
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BeginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const BeginButton({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 200,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding / 1.5, horizontal: defaultPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.blue, offset: Offset(0, -1), blurRadius: 5),
              BoxShadow(color: Colors.red, offset: Offset(0, 1), blurRadius: 5),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink, Colors.blue.shade900],
            ),
          ),
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  fontSize: 16, // Ajustez la taille de la police ici
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
