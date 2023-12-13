import 'package:flutter/material.dart';
import 'package:flutter_responsive_login_ui/subtitle_text.dart';
import 'package:flutter_responsive_login_ui/responsive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Responsive(
          desktop: AnimatedSubtitleText(
              start: 30, end: 40, text: 'Projet '),
          largeMobile: AnimatedSubtitleText(
              start: 30, end: 25, text: 'Projet '),
          mobile: AnimatedSubtitleText(
              start: 25, end: 20, text: 'Projet '),
          tablet: AnimatedSubtitleText(
              start: 40, end: 30, text: 'Projet '),
        ),
        (kIsWeb && Responsive.isLargeMobile(context)
            ? const Responsive(
          desktop: AnimatedSubtitleText(
              start: 30,
              end: 40,
              text: 'EPITECH ',
              gradient: true),
          largeMobile: AnimatedSubtitleText(
              start: 30,
              end: 25,
              text: 'EPITECH ',
              gradient: true),
          mobile: AnimatedSubtitleText(
              start: 25,
              end: 20,
              text: 'EPITECH ',
              gradient: true),
          tablet: AnimatedSubtitleText(
              start: 40,
              end: 30,
              text: 'EPITECH ',
              gradient: true),
        )
            : ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              Colors.pink,
              Colors.blue,
            ]).createShader(bounds);
          },
          child: const Responsive(
            desktop: AnimatedSubtitleText(
                start: 30,
                end: 40,
                text: 'EPITECH ',
                gradient: false),
            largeMobile: AnimatedSubtitleText(
                start: 30,
                end: 25,
                text: 'EPITECH ',
                gradient: false),
            mobile: AnimatedSubtitleText(
                start: 25,
                end: 20,
                text: 'EPITECH ',
                gradient: true),
            tablet: AnimatedSubtitleText(
                start: 40,
                end: 30,
                text: 'EPITECH ',
                gradient: false),
          ),
        ))
      ],
    );
  }
}
