import 'package:flutter/material.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/view/home/home_screen.dart';

void main() {
  runApp(const SkyerApp());
}

class SkyerApp extends StatelessWidget {
  const SkyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
          titleTextStyle: TextStyle(
            color: blackColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      title: 'Skyer',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
      },
    );
  }
}
