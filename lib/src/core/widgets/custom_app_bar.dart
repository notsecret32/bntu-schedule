import 'package:flutter/material.dart';

/// Wrapper over the [AppBar] widget, used to minimize repetitive code.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    this.iconColor = Colors.white,
    this.onPress,
    this.iconWeight,
  });

  /// AppBar title.
  final String title;

  /// Optional icon in front of the title.
  final IconData? icon;

  /// The color of the icon, by default it is `white`.
  final Color? iconColor;

  /// Callback function, triggered by clicking on the icon.
  final Function()? onPress;

  /// The stroke weight for drawing the icon.
  final double? iconWeight;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: _createIcon(),
      title: Text(
        title,
        style: theme.textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// A method that creates a button with an icon, or returns null.
  IconButton? _createIcon() {
    if (icon != null) {
      return IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          weight: iconWeight,
        ),
        onPressed: onPress,
      );
    }

    return null;
  }
}
