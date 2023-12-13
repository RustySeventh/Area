import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';

import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';

class Service extends StatelessWidget {
  final String serviceName;
  final String serviceDescription;
  final String imagePath;

  const Service({
    Key? key,
    required this.serviceName,
    required this.serviceDescription,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 61, 59, 59),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imagePath),
            ),
            const SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceName,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  serviceDescription,
                  style: TextStyle(color: Pallete.whiteColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
