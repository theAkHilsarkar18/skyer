import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
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
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      bodySmall: GoogleFonts.poppins(
        color: blackColor,
        fontSize: 12,
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
      surfaceTintColor: whiteColor,
      backgroundColor: whiteColor,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      titleTextStyle: GoogleFonts.poppins(
        color: blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(blackColor),
      ),
    ),
  );
}
