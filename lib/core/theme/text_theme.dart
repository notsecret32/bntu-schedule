import 'package:flutter/material.dart';

extension CustomTextTheme on TextTheme {
  TextStyle get largeTitle => const TextStyle(
        fontFamily: 'SFProDisplay',
        fontWeight: FontWeight.w900,
        fontSize: 36,
        letterSpacing: 0.38,
      );

  TextStyle get title1 => const TextStyle(
        fontFamily: 'SFProDisplay',
        fontWeight: FontWeight.w700,
        fontSize: 27,
        letterSpacing: 0.35,
      );

  TextStyle get title2Bold => const TextStyle(
        fontFamily: 'SFProDisplay',
        fontWeight: FontWeight.w700,
        fontSize: 22,
        letterSpacing: 0.35,
      );

  TextStyle get title2SemiBold => const TextStyle(
        fontFamily: 'SFProDisplay',
        fontWeight: FontWeight.w600,
        fontSize: 22,
        letterSpacing: 0.35,
      );

  TextStyle get title3 => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 17,
        letterSpacing: -0.41,
      );

  TextStyle get headline => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 17,
        letterSpacing: -0.41,
      );

  TextStyle get body => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
        fontSize: 17,
        letterSpacing: -0.41,
      );

  TextStyle get calloutSemiBold => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 16,
        letterSpacing: -0.32,
      );

  TextStyle get calloutRegular => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        letterSpacing: -0.32,
      );

  TextStyle get subheadlineSemiBold => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 15,
        letterSpacing: -0.24,
      );

  TextStyle get subheadlineRegular => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
        fontSize: 15,
        letterSpacing: -0.24,
      );

  TextStyle get footnoteSemiBold => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        letterSpacing: -0.08,
      );

  TextStyle get footnoteRegular => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
        fontSize: 13,
        letterSpacing: -0.08,
      );

  TextStyle get captionSemiBold => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        letterSpacing: 0,
      );

  TextStyle get captionRegular => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        letterSpacing: 0,
      );

  TextStyle get caption2SemiBold => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w600,
        fontSize: 11,
        letterSpacing: 0.06,
      );

  TextStyle get caption2Regular => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w400,
        fontSize: 11,
        letterSpacing: 0.07,
      );

  TextStyle get medium => const TextStyle(
        fontFamily: 'SFProText',
        fontWeight: FontWeight.w500,
        fontSize: 10,
        letterSpacing: 0.12,
      );
}
