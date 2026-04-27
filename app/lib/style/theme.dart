import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // app color scheme

  // blues
  static const Color blue500 = Color(0xFF3737EA);
  static const Color blue200 = Color(0xFFE6E6FF);

  // neutrals
  static const Color white500 = Color(0xFFFFFFFF);
  static const Color gray200 = Color(0xFFFDFDFD);
  static const Color gray400 = Color(0xFFB5B5B5);
  static const Color gray500 = Color(0xFF545454);
  static const Color black500 = Color(0xFF000000);

  // status
  static const Color red600 = Color(0xFFF03737);
  static const Color yellow200 = Color(0xFFFFF9C4);
  static const Color green200 = Color(0xFFC5FFC5);
  static const Color green300 = Color(0xFF4FB44E);

  // text styles
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w500,
      color: blue500,
    ),
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: black500,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: black500,
    ),
    bodyLarge:
        TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: black500),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: black500,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: gray500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: white500,
    ),
  );

  // shadows
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.20),
      blurRadius: 16,
      spreadRadius: 0,
      offset: const Offset(0, 4),
    ),
  ];

  static final List<BoxShadow> floatShadow = [
    BoxShadow(
        color: black500.withOpacity(0.08),
        blurRadius: 50,
        spreadRadius: 0,
        offset: const Offset(0, 4))
  ];

  // theme application
  static ThemeData get lightTheme {
    return ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.beVietnamPro().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue500,
          primary: blue500,
          onPrimary: white500,
          surface: gray200,
          error: red600,
        ),
        textTheme: textTheme,
        scaffoldBackgroundColor: gray200);
  }
}
