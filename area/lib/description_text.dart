import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart';
import 'package:flutter_responsive_login_ui/responsive.dart';
import 'package:flutter_responsive_login_ui/navigation/co_button.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart' as Constants;

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: start, end: end),
          duration: const Duration(milliseconds: 300),
          builder: (context, value, child) {
            return Text(
              'Bienvenue sur cette application Area\nRabbit Area est une application de création de connexions\nautomatisées entre différents services en ligne.',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
                wordSpacing: 2,
                fontSize: value,
              ),
            );
          },
        ),
      ],
    );
  }
}
