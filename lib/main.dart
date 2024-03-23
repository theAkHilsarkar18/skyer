import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyer/utils/colors.dart';
import 'package:skyer/view/home/home_screen.dart';
import 'package:skyer/view/profile/profile_screen.dart';

void main() {
  runApp(const SkyerApp());
}

class SkyerApp extends StatelessWidget {
  const SkyerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationStyle: AnimationStyle(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 300),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        useMaterial3: true,
        textTheme: TextTheme(
          titleSmall: GoogleFonts.poppins(
            color: greyColor,
            fontSize: 12,
            letterSpacing: 0.5,
          ),
          titleMedium: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            // height: 0.8,
          ),
          titleLarge: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          bodySmall: GoogleFonts.poppins(
            color: whiteColor,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
          bodyLarge: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
          bodyMedium: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: whiteColor,
          titleTextStyle: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      title: 'Skyer',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
