import 'package:flutter/material.dart';

class AvatarWidget {
  static Widget simple_service_avatar(BuildContext context, String image_path) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 80,
      backgroundImage: AssetImage("assets/images/youtube.png"),
    );
  }

  static Widget clickable_service_avatar(
      String image_path, String symbol_path, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed, // Utilisez l'argument onPressed ici pour gérer le clic
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 80,
            backgroundImage: AssetImage(image_path),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Container(
              width: 40, // Adjust the size of the smaller circle as needed
              height: 40, // Adjust the size of the smaller circle as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Center(
                child: Image.asset(
                  symbol_path,
                  width: 50, // Adjust the symbol size as needed
                  height: 50, // Adjust the symbol size as needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}