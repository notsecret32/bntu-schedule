import 'package:flutter/material.dart';

/// Wrapper over the [Text] widget.
///
/// Used to switch the [TextStyle] between two options.
class CustomToggleText extends StatelessWidget {
  const CustomToggleText({
    super.key,
    required this.text,
    required this.activeTextStyle,
    required this.inactiveTextStyle,
    this.isActive = false,
  });

  /// Displayed text.
  final String text;

  /// The [TextStyle] when the widget is activated.
  final TextStyle activeTextStyle;

  /// The [TextStyle] when the widget is inactivated.
  final TextStyle inactiveTextStyle;

  /// Switches [TextStyle].
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isActive ? activeTextStyle : inactiveTextStyle,
    );
  }
}
