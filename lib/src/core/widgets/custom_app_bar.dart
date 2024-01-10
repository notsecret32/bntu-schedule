import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.icon,
    this.iconColor = Colors.white,
    this.onPress,
    this.weight,
  });

  final String title;
  final IconData? icon;
  final Color? iconColor;
  final Function()? onPress;
  final double? weight;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      leading: IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          weight: weight,
        ),
        onPressed: onPress,
      ),
      title: Text(
        title,
        style: theme.textTheme.headlineLarge,
      ),
    );
  }
}
