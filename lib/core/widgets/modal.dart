import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class Modal extends StatelessWidget {
  const Modal({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 54,
      decoration: const BoxDecoration(
        color: lightBackgroundPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: child,
    );
  }
}
