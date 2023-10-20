import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/pages/splash_screen.page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenPage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
    );
  }
}
