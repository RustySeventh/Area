import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> handleSpotifyAuthCallback(Uri callbackUri) async {
  // Extract the authorization code from the callback URL
  String authorizationCode = callbackUri.queryParameters['code'] ?? '';

  // Define your Spotify API credentials
  String clientId = 'your_client_id';
  String clientSecret = 'your_client_secret';

  // Create a map with the required data
  Map<String, String> data = {
    'grant_type': 'authorization_code',
    'code': authorizationCode,
    'redirect_uri': 'http://127.0.0.1:8080/callback', // Make sure it matches your Spotify app's settings
  };

  // Set up basic authentication header
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}';
  Map<String, String> headers = {
    'Authorization': basicAuth,
    'Content-Type': 'application/x-www-form-urlencoded',
  };

  // Make a POST request to Spotify's token endpoint
  var response = await http.post(
    Uri.parse('https://accounts.spotify.com/api/token'),
    headers: headers,
    body: data,
  );

  return response; // Return the response to the caller
}
