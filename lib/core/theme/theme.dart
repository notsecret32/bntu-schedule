import 'package:bntu_schedule/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// Application appearance settings.
final ThemeData themeData = ThemeData(
  useMaterial3: true,

  /// ========== [Colors] ==========
  shadowColor: shadowColor,
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  scaffoldBackgroundColor: const Color(0xFFEFEFEF),

  /// ========== [App Bar Theme] ==========
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: primaryColor,
  ),

  /// ========== [Text Theme] ==========
  textTheme: const TextTheme(
    /// ========== [Titles] ==========
    /// Using for:
    /// * Page Title (Schedule, Teacher and etc.)
    headlineLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    /// ========== [Label] ==========
    /// Using for:
    /// * Lesson type (Lecture, Practice and etc.)
    labelLarge: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),

    /// Using for:
    /// * Month Name (December, November and etc.)
    labelMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),

    /// Using for:
    /// * Buttons Text
    /// * Dropdown Search Text
    titleSmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),

    /// ========== [Body] ==========
    /// Using for:
    /// * Week Day Text (MON, WED, TUE and etc.)
    /// * Week Day Number
    /// * Lesson Name
    bodyMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),

    /// Using for:
    /// * Week Type (1-st or 2-nd week)
    /// * Classroom
    /// * Lesson time (start & end)
    /// * Teacher
    bodySmall: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: Color(0xFF747474),
    ),
  ),
);
