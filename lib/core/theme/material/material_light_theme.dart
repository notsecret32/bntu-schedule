import 'package:flutter/material.dart';

import '../colors/graphic_colors.dart';
import '../colors/light_colors.dart';

final ThemeData materialLightTheme = ThemeData(
  brightness: Brightness.light,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? lightBackgroundSecondary
            : graphicsBlue,
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? lightLabelSecondary
            : lightBackgroundPrimary,
      ),
      textStyle: const MaterialStatePropertyAll<TextStyle>(
        TextStyle(
          fontFamily: 'SFProText',
          fontWeight: FontWeight.w600,
          fontSize: 17,
          letterSpacing: -0.41,
        ),
      ),
      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(
          vertical: 16,
        ),
      ),
      shape: const MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    ),
  ),
);
