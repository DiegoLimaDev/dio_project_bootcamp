import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [Colors.greenAccent, Colors.blueGrey],
                stops: [0.6, 0.9])),
        child: Center(
          child: AnimatedTextKit(
              onFinished: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const LoginPage())),
              totalRepeatCount: 1,
              animatedTexts: [
                TypewriterAnimatedText('Hello world!',
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    speed: const Duration(milliseconds: 200))
              ]),
        ),
      ),
    ));
  }
}
