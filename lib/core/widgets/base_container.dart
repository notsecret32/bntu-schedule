import 'package:bntu_schedule/core/theme/colors.dart';
import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.elevationColor = shadowColor,
    this.activeColor = primaryColor,
    this.inactiveColor = Colors.white,
    this.isActive = false,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? elevation;
  final BorderRadiusGeometry? borderRadius;
  final Color elevationColor;
  final Color activeColor;
  final Color inactiveColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? _defaultPadding,
      decoration: BoxDecoration(
        boxShadow: elevation ?? _defaultBoxShadow,
        color: isActive ? activeColor : inactiveColor,
        borderRadius: borderRadius ?? _defaultBorderRadius,
      ),
      child: child,
    );
  }

  EdgeInsetsGeometry get _defaultPadding => const EdgeInsets.all(8);

  List<BoxShadow> get _defaultBoxShadow => <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 4,
          color: elevationColor,
        ),
      ];

  BorderRadiusGeometry get _defaultBorderRadius =>
      const BorderRadiusDirectional.all(
        Radius.circular(8),
      );
}
