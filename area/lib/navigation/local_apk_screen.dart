import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class LocalAPKScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local APK Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InAppWebView(
                  initialFile: "assets/app/shared/app-release.apk",
                ),
              ),
            );
          },
          child: Text('Open Local APK'),
        ),
      ),
    );
  }
}
