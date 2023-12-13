import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/Icons/profil.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
      ),
    ],
  );
}