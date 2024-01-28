import 'package:bntu_schedule/core/widgets/custom_app_bar_action_button.dart';
import 'package:flutter/material.dart';

/// Wrapper over the [AppBar] widget, used to minimize repetitive code.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.leadingIconColor,
    this.onLeadingIconPress,
    this.leadingIconWeight,
    this.actions,
  });

  /// AppBar title.
  final String title;

  /// Optional icon in front of the title.
  final IconData? leadingIcon;

  /// The color of the icon, by default it is `white`.
  final Color? leadingIconColor;

  /// Callback function, triggered by clicking on the icon.
  final Function()? onLeadingIconPress;

  /// The stroke weight for drawing the icon.
  final double? leadingIconWeight;

  final List<CustomAppBarActionButton>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      leading: _createLeadingIcon(theme),
      actions: actions,
      title: Text(
        title,
        style: theme.textTheme.headlineLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  /// A method that creates a button with an icon, or returns null.
  Widget? _createLeadingIcon(ThemeData theme) {
    if (leadingIcon != null) {
      return IconButton(
        icon: Icon(
          leadingIcon,
          color: leadingIconColor ?? theme.colorScheme.onPrimary,
          weight: leadingIconWeight,
        ),
        onPressed: onLeadingIconPress,
      );
    }

    return null;
  }
}
