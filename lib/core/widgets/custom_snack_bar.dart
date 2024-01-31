import 'package:flutter/material.dart';

class CustomSnackBarViewer {
  static void showSnackBar({
    required BuildContext context,
    required String text,
    bool isError = false,
  }) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: isError ? colorScheme.error : colorScheme.primary,
        content: Text(
          text,
          style: textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
