import 'package:bntu_schedule/src/core/theme/colors.dart';
import 'package:flutter/material.dart';

/// A wrapper over a regular [Container], used to reduce repetitive code.
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.padding,
    this.boxShadow,
    this.borderRadius,
    this.elevationColor,
    this.activeColor,
    this.inactiveColor,
    this.isActive = false,
  });

  /// The [Widget] that will be rendered inside the container.
  final Widget child;

  /// Empty space to inscribe inside the [decoration].
  /// The [child], if any, is placed inside this padding.
  final EdgeInsetsGeometry? padding;

  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow>? boxShadow;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  final BorderRadiusGeometry? borderRadius;

  /// Shadow color.
  final Color? elevationColor;

  /// The active color if the container is activated.
  final Color? activeColor;

  /// Inactive color if the container is activated.
  final Color? inactiveColor;

  /// Indicates whether the [CustomContainer] is activated.
  ///
  /// It is used to indicate to the user that this element is activated.
  ///
  /// `isActive` refers to changing the background to `activeColor`.
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? _defaultPadding,
      decoration: BoxDecoration(
        boxShadow: boxShadow ?? _defaultBoxShadow,
        color: isActive
            ? activeColor ?? primaryColor
            : inactiveColor ?? Colors.white,
        borderRadius: borderRadius ?? _defaultBorderRadius,
      ),
      child: child,
    );
  }

  /// Returns the default padding value if it is not specified.
  EdgeInsetsGeometry get _defaultPadding => const EdgeInsets.all(8);

  /// Returns the default box shadow value if it is not specified.
  List<BoxShadow> get _defaultBoxShadow => <BoxShadow>[
        BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 4,
          color: elevationColor ?? shadowColor,
        ),
      ];

  /// Returns the default border radius value if it is not specified.
  BorderRadiusGeometry get _defaultBorderRadius =>
      const BorderRadiusDirectional.all(
        Radius.circular(8),
      );
}
