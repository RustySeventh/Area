// import 'package:flutter/material.dart';
// import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';
// import 'package:flutter_responsive_login_ui/responsive/navbar.dart';
// import 'package:flutter_responsive_login_ui/reaction_query.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
// import 'package:flutter_responsive_login_ui/widgets/avatar_socials.dart';
// import 'package:flutter_responsive_login_ui/widgets/header_text.dart';
// import 'package:flutter_responsive_login_ui/widgets/active_inactive.dart';
// import 'package:flutter_responsive_login_ui/widgets/input_text.dart';
// import 'package:flutter_responsive_login_ui/widgets/add_button.dart';

// class YoutubeService extends StatefulWidget {
//   @override
//   _YoutubeServiceState createState() => _YoutubeServiceState();
// }

// class _YoutubeServiceState extends State<YoutubeService> {
//   TextEditingController _textFieldController = TextEditingController();
//   String? _connectedChannel;
//   bool isActive = false;
//   bool switchValue = false;
//   bool value = false;
//   String channel_name = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bienvenue sur le service YOUTUBE'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(50.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               AvatarWidget.simple_service_avatar(context, "assets/images/youtube.png"),
//               SizedBox(height: 20),
//               active_inactive(switchValue, (p0) {
//                 setState(() {
//                   switchValue = p0;
//                 });
//               }),
//               SizedBox(height: 20),
//               input_text.simple_input(
//                   controller: _textFieldController,
//                   maxlength: 60,
//                   hintText: 'Entrez le tag de la chaine',
//                   onTextChanged: (text) {
//                     channel_name = text;
//                   }),
//               SizedBox(height: 20),
//               CheckButton(
//                   display: CheckDisplay.Icon,
//                   buttonText: 'ADD',
//                   onPressed: () =>
//                       call_youtube_triggers(context, 'a channel', switchValue),
//                   redirectFunction: (context) {
//                     print(channel_name);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CirclePage()),
//                     );
//                   },
//                   buttonWidth: 150,
//                   buttonHeight: 100
//                 ),
//             ], // Add this closing bracket
//           ), // Add this closing bracket
//         ), // Add this closing bracket
//       ), // Add this closing bracket
//       bottomNavigationBar: BottomNavBar(),
//     );
//   }
// }