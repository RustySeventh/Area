import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/services.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/services/service_youtube.dart';
import 'package:flutter_responsive_login_ui/action_page.dart';

class MobileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'Bienvenue sur area mobile',
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                  color: Colors.black, // Ajoutez la couleur du texte
                ),
              ),
              // SizedBox(height: 25),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(Icons.search, color: Colors.grey), // Ajoutez la couleur de l'icône
              //       hintText: 'Find your next favorite thing...',
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade600),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey.shade600),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 25),
              // Container(
              //   height: 300,
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       children: [
              //         InkWell(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => YoutubeService(),
              //               ),
              //             );
              //           },
              //           child: Service(
              //             serviceName: 'Youtube',
              //             serviceDescription: 'It is the YouTube service',
              //             imagePath: 'assets/images/youtube.png',
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
