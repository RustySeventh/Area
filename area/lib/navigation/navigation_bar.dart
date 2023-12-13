import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/navigation/download_apk_button.dart';
import 'package:flutter_responsive_login_ui/side_menu_button.dart';
import 'package:flutter_responsive_login_ui/responsive.dart';
import 'package:flutter_responsive_login_ui/navigation/download_apk_button.dart';
import '../../../res/constants.dart';
import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child:!Responsive.isLargeMobile(context)? Image.asset('assets/images/logo_rabbit.png') : Container(),
            ),
            const Spacer(flex: 2,),
            if(!Responsive.isLargeMobile(context))  const NavigationButtonList(),
            const Spacer(flex: 2,),
            const DownloadAPK(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
