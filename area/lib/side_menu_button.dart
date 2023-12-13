import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart';

class MenuButton extends StatelessWidget {
  final VoidCallback? onTap;
  const MenuButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent.withOpacity(.5),
                  offset: const Offset(1, 1),
                ),
                BoxShadow(
                  color: Colors.blue.withOpacity(.5),
                  offset: const Offset(-1, -1),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const Spacer(
          flex: 5,
        )
      ],
    );
  }
}