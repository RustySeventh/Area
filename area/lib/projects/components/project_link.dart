import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;

  const ProjectLinks({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              projectList[index].serviceText,
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
            // IconButton(
            //   onPressed: () {
            //     launch(projectList[index].link); // Passer la chaîne de caractères directement à la fonction launch
            //   },
            //   icon: SvgPicture.asset('assets/icons/github.svg'),
            // ),
          ],
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            launch(projectList[index].link); // Passer la chaîne de caractères directement à la fonction launch
          },
          child: const Text(
            'Accéder au service -->',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        )
      ],
    );
  }
}
