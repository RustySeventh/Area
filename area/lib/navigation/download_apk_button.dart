import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_responsive_login_ui/navigation/local_apk_screen.dart';
import '../../../res/constants.dart';
import 'package:universal_html/html.dart' as html;

class DownloadAPK extends StatelessWidget {
  const DownloadAPK({Key? key}) : super(key: key);

  void _downloadRemoteApk() {
    final html.AnchorElement anchorElement = html.AnchorElement(href: '/apk/app-release.apk');
    anchorElement.target = 'blank';
    anchorElement.download = 'area.apk';
    anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    final bool isWeb = html.window != null;

     return isWeb
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: InkWell(
              onTap: _downloadRemoteApk,
              borderRadius: BorderRadius.circular(defaultPadding + 10),
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  gradient: LinearGradient(
                    colors: [Colors.pink, Colors.blue.shade900],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blue,
                      offset: Offset(0, -1),
                      blurRadius: 5,
                    ),
                    BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.download,
                      color: Color.fromARGB(255, 249, 251, 251),
                      size: 18,
                    ),
                    const SizedBox(width: defaultPadding / 4),
                    Text(
                      'Download APK',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.white,
                            fontSize: 10,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(); // Cachez le bouton sur les plates-formes autres que web
  }
}