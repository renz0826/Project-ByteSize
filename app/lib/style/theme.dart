import 'package:flutter/material.dart';

class AppTheme {
  // app color scheme

  // greens
  static const Color green500 = Color(0xFF388037);
  static const Color green400 = Color(0xFF48A447);
  static const Color green300 = Color(0xFF4FB44E);
  static const Color green700 = Color(0xFF214C21);
  static const Color green200 = Color(0xFFC5FFC5);

  // neutrals
  static const Color white500 = Color(0xFFFFFFFF);
  static const Color gray200 = Color(0xFFFDFDFD);
  static const Color gray400 = Color(0xFFB5B5B5);
  static const Color gray500 = Color(0xFF545454);
  static const Color black500 = Color(0xFF000000);

  // status
  static const Color red600 = Color(0xFFB50000);
  static const Color yellow200 = Color(0xFFFFF9C4);
  static const Color yellow600 = Color(0xFFFFC107);

  // text styles
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w500,
      color: green500,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: black500,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
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

  // theme application
  static ThemeData get lightTheme {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: green500,
          primary: green500,
          onPrimary: white500,
          surface: gray200,
          error: red600,
        ),
        textTheme: textTheme,
        scaffoldBackgroundColor: gray200);
  }
}
