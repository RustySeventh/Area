import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/res/constants.dart';

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        builder: (context, value, child) => Column(
          children: [
            Container(
              width: 130,
              child: LinearProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.deepPurpleAccent,
                value: value,
              ),
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              '${(value * 100).toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(color: Colors.pink, blurRadius: 10, offset: Offset(2, 2)),
                  Shadow(color: Colors.blue, blurRadius: 10, offset: Offset(-2, -2)),
                ],
              ),
            )
          ],
        ),
        tween: Tween(begin: 0.0, end: 1.0),
      ),
    );
  }
}
