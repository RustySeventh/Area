import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'project_deatail.dart';
import 'package:get/get.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/services/service_youtube.dart';
import 'image_viewer.dart';
import 'package:flutter_responsive_login_ui/action_page.dart';
import 'package:flutter_responsive_login_ui/API_call/API_call.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:intl/intl.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/projects/components/GlobalData.dart';

class ProjectStack extends StatelessWidget {
  final ProjectController controller = Get.put(ProjectController());
  final int index;
  final GlobalData globalTriggers = GlobalData();
  final Trigger trigger = Trigger(
    id: 1,
    action: TriggerAction(
      name: 'initial_action_name',
      active: true,
      data: Data(data: {}),
    ),
    reaction: Reaction(
      name: 'initial_reaction_name',
      data: Data(data: {}),
    ),
  );

  ProjectStack({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    globalTriggers.initTriggers(context);

    var size = MediaQuery.of(context).size;
    var imageSize = size.width * 0.2; // Ajustez le facteur 0.2 selon vos besoins

    return InkWell(
      onHover: (value) {
        controller.onHover(index, value);
      },
      onTap: () {
        if (projectList[index].name == 'Youtube') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActionPage(type: 'youtube', globalTriggers: globalTriggers, trigger: trigger),

            ),
          );
        } else if (projectList[index].name == 'Discord') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActionPage(type: 'discord', globalTriggers: globalTriggers, trigger: trigger),
            ),
          );
        } else if (projectList[index].name == 'Météo') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActionPage(type: 'meteo', globalTriggers: globalTriggers, trigger: trigger),
            ),
          );
        } else if (projectList[index].name == 'Timer') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActionPage(type: 'timer', globalTriggers: globalTriggers, trigger: trigger),
            ),
          );
        } else if (projectList[index].name == 'Convertisseur') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActionPage(type: 'devises', globalTriggers: globalTriggers, trigger: trigger),
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          top: defaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
        ),
        duration: const Duration(milliseconds: 500),
        child: Stack(
          children: [
            if (projectList[index].name == 'Youtube')
              Center(
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset('assets/images/youtube.png'),
                ),
              ),
            if (projectList[index].name == 'Discord')
              Center(
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset('assets/images/discord.png'),
                ),
              ),
            if (projectList[index].name == 'Météo')
              Center(
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset('assets/images/meteo.png'),
                ),
              ),
            if (projectList[index].name == 'Timer')
              Center(
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset('assets/images/timer.png'),
                ),
              ),
            if (projectList[index].name == 'Convertisseur')
              Center(
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset('assets/images/devise.png'),
                ),
              ),
            if (projectList[index].name == 'Heure')
              Center(
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 3, 28), // Changez la couleur de fond si nécessaire
                    borderRadius: BorderRadius.circular(imageSize / 2),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('HH:mm').format(DateTime.now()),
                      style: TextStyle(fontSize: _getFontSize(size), fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ProjectDetail(index: index), // Assurez-vous que ProjectDetail est défini et implémenté
          ],
        ),
      ),
    );
  }

  double _getFontSize(Size size) {
    if (size.width > 100) {
      return size.width * 0.05; // Ajustez le facteur 0.05 pour les écrans plus grands
    } else {
      return size.width * 0.1; // Ajustez le facteur 0.1 pour les écrans plus petits
    }
  }
}