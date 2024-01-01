import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF4787E8);

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
    titleMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),
);
