import 'package:flutter/material.dart';

import '../colors/graphic_colors.dart';

final ThemeData materialLightTheme = ThemeData(
  brightness: Brightness.light,
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(graphicsBlue),
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    ),
  ),
);
