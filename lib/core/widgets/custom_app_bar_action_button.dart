import 'package:flutter/material.dart';

class CustomAppBarActionButton extends StatelessWidget {
  const CustomAppBarActionButton({
    super.key,
    required this.icon,
    this.iconColor,
    this.iconWeight,
    this.onPressed,
  });

  final IconData icon;
  final Color? iconColor;
  final double? iconWeight;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        weight: iconWeight,
        color: iconColor ?? colorScheme.onPrimary,
      ),
    );
  }
}
