import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/API_call/API_call.dart';
import 'package:flutter_responsive_login_ui/Connexion/login_screen.dart';
import 'package:flutter_responsive_login_ui/Connexion/registration_screen.dart';
import 'package:flutter_responsive_login_ui/homepage.dart';
import 'package:flutter_responsive_login_ui/res/pallete.dart';
import 'package:flutter_responsive_login_ui/res/my_theme.dart';
import 'package:flutter_responsive_login_ui/responsive/CustomDrawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'package:flutter_responsive_login_ui/responsive/utils/globals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_responsive_login_ui/API_call/Triggers.dart';
import 'dart:io';

Future<void> call_login(
    BuildContext context, String email, String password) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/login"; // API endpoint
  print('In login email: $email');
  print('In login password: $password');

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['success'] != null && responseData['success'] == true) {
        token = responseData['token'];
        print('In login token: $token');
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        print('Login successful');
      } else {
        print('Login failed: ${responseData['message']}');
      }
    } else {
      print('Login failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Login failed. Exception: $e');
  }
}

Future<void> call_logout(BuildContext context) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/logout";
  print('in logout token: $token');
  final Map<String, String> headers = {
    'Authorization': token,
  };
  try {
    final response = await http.post(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['success'] == true) {
        print('${responseData['message']}');
      } else {
        if (responseData['message'] == "You're not logged in") {
          print('${responseData['message']}');
        } else {
          print('${responseData['message']}');
        }
      }
    } else if (response.statusCode == 401) {
      print('Logout failed, user not logged in');
    } else {
      print('Logout failed. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Logout failed. Exception: $e');
  }
}

Future<void> call_register(BuildContext context, String username, String email,
    String password) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/register"; // API endpoint

  // print(
  //     'Registering user with email: $email, username: $username, password: $password');

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['success'] == true && responseData['token'] != null) {
        print('User registration successful: ${responseData['message']}');
        token = responseData['token'];
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else if (responseData['message'] == 'Email already exists') {
        print('${responseData['message']}');
      } else if (responseData['message'] ==
          'At least one of the fields is empty') {
        print('${responseData['message']}');
      } else {
        print('User registration failed. Status code: ${response.statusCode}');
      }
    } else {
      print('User registration failed. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('User registration failed. Exception: $e');
  }
}

Future<void> call_update_triggers(BuildContext context, List<Trigger> triggers) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/update_triggers"; // API endpoint

  final Map<String, String> headers = {
    'Authorization': token,
    'Content-Type': 'application/json',
  };

  String jsonString = jsonEncode(triggers.map((trigger) => trigger.toJson()).toList());

  print('JSON string: $jsonString');

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonString,
    );
    print ('Response status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      print('Response data: ' + responseData['success']);
      print('Response data: ' + responseData['message']);

      if (responseData['success'] == true) {
        print('Triggers updated: ${responseData['message']}');
      } else {
        print('Triggers update failed. Status code: ${response.statusCode}');
      }
    }
  } catch (e) {
    print('Triggers update failed. Exception: $e');
  }
}

Future<String> call_user_data(BuildContext context) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/get_user_data";

  final Map<String, String> headers = {
    'Authorization': token,
  };

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      String responseString = response.body;
      responseString = responseString.replaceAll("'", '"');
      responseString = responseString.replaceAll("[\"", '[');
      responseString = responseString.replaceAll("\"]", ']');
      responseString = responseString.replaceAll("}\"", '}');
      responseString = responseString.replaceAll("\"{", '{');
      responseString = responseString.replaceAll("True", 'true');
      responseString = responseString.replaceAll("False", 'false');
      print("\n\nresponse de call_user_data: " + responseString + "\n\n");
      return responseString;
    } else {
      print('User data request failed. Status code: ${response.statusCode}');
      return '';
    }
  } catch (e) {
    print('User data request failed. Exception: $e');
    return '';
  }
}

Future<void> call_get_notif(BuildContext context) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/get_notif";

  final Map<String, String> headers = {
    'Authorization': token,
  };

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData.containsKey('notifications')) {
        final notifications = responseData['notifications'] as List<dynamic>;
        for (var notification in notifications) {
          final header = notification['header'] as String;
          final content = notification['content'] as String;

          // Print each notification
          print('Header: $header');
          print('Content: $content');
          print('---'); // Separator for multiple notifications
        }
      } else {
        print('No notifications found.');
      }
    } else {
      print(
          'Fetching notifications failed. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Fetching notifications failed. Exception: $e');
  }
}

Future<void> call_spotify_auth(BuildContext context) async {
  ///call spotify_login
  ///envoyer get.le reslutat de spotify login
  ///call spotify_callback
  String lineurl = "";
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/spotify_login";
  final Map<String, String> headers = {
    'Authorization': token,
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      var responseData = jsonDecode(response.body);
      lineurl = responseData['url'] + "&state=" + token;
    }
  } catch (e) {
    print(e);
    print("nooooo");
  }

  try {
    Uri launchUri = Uri.parse(lineurl);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      print("Could not open the URL");
    }
  } catch (e) {
    print(e);
    print("nooooo");
  }

  
}

Future<void> call_google_auth(BuildContext context) async {
  String lineurl = "";
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/google_login";
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  try {
    final response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      var responseData = jsonDecode(response.body);
      lineurl = responseData['url'];
    }
  } catch (e) {
    print(e);
    print("nooooo");
  }

  try {
    Uri launchUri = Uri.parse(lineurl);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      print("Could not open the URL");
    }
  } catch (e) {
    print(e);
    print("nooooo");
  }

  
}

Future<bool> _checkCallbackReceived(String callbackUrl) async {
  try {
    final response = await http.get(Uri.parse(callbackUrl));
    print("Response: ${response.body}");
    // Check the response to determine if the callback has been received
    // You should implement the logic to check the response as needed.
    // If the callback is received, return true; otherwise, return false
    return response.statusCode == 200;
  } catch (e) {
    // Handle any errors that occur during the HTTP request
    print("Error checking callback: $e");
    return false; // Assume the callback hasn't been received
  }
}
//   const String apiUrl =
//       "https://accounts.spotify.com/authorize?client_id=c79764feec874a338c078ecc93d406ea&response_type=code&redirect_uri=http%3A%2F%2F127.0.0.1%3A8080%2Fcallback&show_dialog=True";
//   const String apiUr2 = "http://127.0.0.1:8080/spotify_callback";
//   try {
//     // Check if the URL can be launched
//     if (await canLaunch(apiUrl)) {
//       await launch(apiUrl);
//     } else {
//       // Handle the case where the URL cannot be launched, e.g., show an error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Could not open the Spotify authorization page."),
//         ),
//       );
//     }
//   } catch (e) {
//     print("Error: $e");
//     // Handle any other exceptions that may occur during the URL launch
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//             "An error occurred while opening the Spotify authorization page."),
//       ),
//     );
//   }

//   try {
//     final response = await http.get(Uri.parse(apiUr2));
//     var responseData = jsonDecode(response.body);
//     final responseString = responseData.body;
//     print(responseData);
//   } catch (e) {
//     print("nooooo");
//   }

//   ///waiting for answer from http://127.0.0.1:8080/callback for login
// }
////Call notification api

Future<void> call_remove_trigger(BuildContext context, int triggerId) async {
  const String host = String.fromEnvironment('HOST_IP');
  const String apiUrl = "http://" + host + ":8080/api/update_triggers"; // API endpoint

  final Map<String, String> headers = {
    'Authorization': token,
    'Content-Type': 'application/json',
  };

  try {
    final request = http.Request('DELETE', Uri.parse(apiUrl));
    request.headers.addAll(headers);
    request.body = jsonEncode([triggerId.toString()]);

    final response = await http.Client().send(request);
    print('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      var responseData = jsonDecode(await response.stream.bytesToString());
      if (responseData['success'] == true) {
        print('Trigger removed: ${responseData['message']}');
      } else {
        print('Remove trigger failed. Status code: ${response.statusCode}');
      }
    }
  } catch (e) {
    print('Remove trigger failed. Exception: $e');
  }
}
