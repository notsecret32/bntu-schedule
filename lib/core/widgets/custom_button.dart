import 'package:flutter/material.dart';

/// Wrapper above the [TextButton] with added styling
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPress,
    this.backgroundColor,
    this.textColor,
  });

  /// Required button text.
  final String text;

  /// Callback function, triggered by pressing a button.
  final void Function()? onPress;

  /// The background of the button.
  ///
  /// If the color is not specified, `theme.colorScheme.primary`
  /// is used by default.
  final Color? backgroundColor;

  /// Text color.
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: TextButton(
        onPressed: onPress,
        child: Text(
          text,
          style: theme.textTheme.titleSmall!.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
