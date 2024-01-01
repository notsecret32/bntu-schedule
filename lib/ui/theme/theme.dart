import 'package:bntu_schedule/ui/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: primaryColor,
  ),
  textTheme: const TextTheme(
    // Titles like: Schedule
    headlineLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    // Container labels like: Lesson name
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    // Container labels like: Month (December, November and etc.)
    labelMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    // For text like: Lesson name, week day, week number and etc.
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    // For text like: 1st week, 2nd week, lesson time and etc.
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Color(0xFF747474),
    ),
  ),
  shadowColor: shadowColor,
);
