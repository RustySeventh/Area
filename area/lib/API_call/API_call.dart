import 'dart:io';
import 'package:flutter_responsive_login_ui/API_call/spotiauth.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/API_functions.dart';
import 'package:flutter_responsive_login_ui/API_call/Auth.dart';
import 'package:flutter_responsive_login_ui/API_call/authenpage.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:get/get.dart';

class Api_Page extends StatefulWidget {
  const Api_Page({Key? key}) : super(key: key);

  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<Api_Page> {
  List<Map<String, dynamic>> buttons = [
    {'number': 1, 'text': 'Call Login'},
    {'number': 2, 'text': 'Call logout'},
    {'number': 3, 'text': 'Call register'},
    {'number': 4, 'text': 'Call update triggers'},
    {'number': 5, 'text': 'Call user data'},
    {'number': 6, 'text': 'Receive notifications'},
    {'number': 8, 'text': 'spotify auth'},
    {'number': 9, 'text': 'Authenprocess'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Page'),
      ),
      body: ListView.builder(
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          int number = buttons[index]['number'];
          String buttonText = buttons[index]['text'];
          // Trigger trigger = Trigger (
          //   id: 1,
          //     action: {
          //       "name": "yt_new_video",
          //       "active": true,
          //       "data": {
          //         "channel_name": "UCk5BRJYeUu_umvkyZwSxvsQ",
          //       },
          //     },
          //     reaction: {
          //       "name": "spotify_delete_playlist",
          //       "data": {
          //         "name": "ma_playlist",
          //       },
          //     }
          // )
          return ListTile(
              title: Row(
                children: [
                  Text('Button $number:'),
                  SizedBox(width: 10), // Adjust the spacing as needed
                  Text(buttonText),
                ],
              ),
              onTap: () {
                // Handle button click here
                if (buttonText == 'Call Login') {
                  // call_login(context, 'notlogged@mail.com', '123');
                  // sleep(Duration(seconds: 1));
                  // call_login(context, 'azerty@mail.com', 'incorrect');
                  // sleep(Duration(seconds: 1));
                  // call_login(context, 'azerty13@mail.com', '123');
                  // sleep(Duration(seconds: 1));
                  call_login(context, 'azerty13@mail.com', '123');
                }
                if (buttonText == 'Call logout') {
                  call_logout(context);
                }
                if (buttonText == 'Call register') {
                  call_register(
                      context, 'azerty13', 'azerty13@mail.com', '123');
                }
                if (buttonText == 'Call update triggers') {
                  Trigger trigger = Trigger(
                    id: 1,
                    action: TriggerAction(
                      name: "yt_new_video",
                      active: true,
                      data: Data(data: {"channel_name": "UCk5BRJYeUu_umvkyZwSxvsQ"}),
                    ),
                    reaction: Reaction(
                      name: "spotify_create_playlist",
                      data: Data(data: {
                        "name": "123",
                        "description": "123",
                        "public": false,
                      }),
                    ),
                  );
                  call_update_triggers(context,[trigger]);}
                if (buttonText == 'Call user data') {
                  call_user_data(context);
                }
                if (buttonText == 'Receive notifications') {
                  call_get_notif(context);
                }
                if (buttonText == 'spotify auth') {
                  call_spotify_auth(context);
                }
                if (buttonText == 'Authenprocess') {
                    Navigator.of(context)?.push(
                     MaterialPageRoute(builder: (context) => spotiyathenprocess()),
                );
                }
              });
        },
      ),
    );
  }
}
