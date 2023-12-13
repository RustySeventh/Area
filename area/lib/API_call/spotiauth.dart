import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class spotiyathenprocess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spotify Auth Example'),
        ),
        body: SpotifyAuthWebView(),
      ),
    );
  }
}

class SpotifyAuthWebView extends StatefulWidget {
  @override
  _SpotifyAuthWebViewState createState() => _SpotifyAuthWebViewState();
}

class _SpotifyAuthWebViewState extends State<SpotifyAuthWebView> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    // Open the Spotify authentication URL in the WebView.
    flutterWebViewPlugin.launch(
      'https://www.google.com/',
      // 'https://accounts.spotify.com/authorize?client_id=YOUR_CLIENT_ID&response_type=token&redirect_uri=YOUR_CALLBACK_URL',
      withJavascript: true,
      withZoom: true,
    );

    // Listen for URL changes in the WebView.
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      // Check if the URL contains your callback URL.
      if (url.startsWith('YOUR_CALLBACK_URL')) {
        // Extract the access token from the URL.
        String accessToken = Uri.parse(url).fragment.split('&')[0].split('=')[1];
        // Now you have the access token, and you can use it for API requests.
        print('Access Token: $accessToken');

        // Close the WebView or navigate to the next page in your app.
        flutterWebViewPlugin.close();

        // Perform the necessary actions with the access token here.
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://accounts.spotify.com/authorize?client_id=YOUR_CLIENT_ID&response_type=token&redirect_uri=YOUR_CALLBACK_URL',
      withJavascript: true,
      withZoom: true,
    );
  }
}