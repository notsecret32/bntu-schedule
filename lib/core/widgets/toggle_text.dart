import 'package:flutter/material.dart';

class ToggleText extends StatelessWidget {
  const ToggleText({
    super.key,
    required this.text,
    required this.activeTextStyle,
    required this.inactiveTextStyle,
    this.isActive = false,
  });

  final String text;
  final TextStyle activeTextStyle;
  final TextStyle inactiveTextStyle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isActive ? activeTextStyle : inactiveTextStyle,
    );
  }
}