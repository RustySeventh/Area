import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/side_menu_button.dart';
import 'package:flutter_responsive_login_ui/responsive.dart';
import 'controller.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart';
import 'navigation_button_list.dart';
import 'package:flutter_responsive_login_ui/navigation/navigation_bar.dart';
import 'package:flutter_responsive_login_ui/projects/components/drawer/drawer.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
class MainView extends StatelessWidget {
  const MainView({Key? key, required this.pages, required this.bottomNavigationBar})
      : super(key: key);

  final List<Widget> pages;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(height: defaultPadding * 2)
                : const SizedBox(height: defaultPadding / 2),
            const SizedBox(
              height: 80,
              child: TopNavigationBar(),
            ),
            if (Responsive.isLargeMobile(context))
              const Row(children: [Spacer(), NavigationButtonList(), Spacer()]),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [...pages],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
