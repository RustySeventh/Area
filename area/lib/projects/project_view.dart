import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/view model/getx_controllers/projects_controller.dart';
import 'components/projects_grid.dart';
import 'components/title_text.dart';
import 'package:get/get.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({Key? key});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    final double mobileWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (mobileWidth >= 600) SizedBox(height: 16.0), // Utiliser directement la valeur de l'espacement par défaut
          const TitleText(prefix: 'Liste', title: 'de services'),
          const SizedBox(height: 16.0), // Utiliser directement la valeur de l'espacement par défaut
          Expanded(
            child: getProjectGrid(mobileWidth),
          ),
        ],
      ),
    );
  }

  Widget getProjectGrid(double mobileWidth) {
    if (mobileWidth >= 1280) {
      return ProjectGrid(crossAxisCount: 4);
    } else if (mobileWidth >= 1024) {
      return ProjectGrid(crossAxisCount: 3);
    } else if (mobileWidth >= 650) {
      return ProjectGrid(crossAxisCount: 2, ratio: 1.4);
    } else {
      return ProjectGrid(crossAxisCount: 1, ratio: 1.5);
    }
  }
}
