import 'package:flutter/material.dart';

/// The wrapper over the [TextFormField] is used to minimize repetitive code.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword,
    this.controller,
    this.validator,
  });

  /// Text with a hint.
  final String hintText;

  /// A flag indicating that this widget stores a password.
  ///
  /// This widget hides the text, disables auto-correction and suggestions.
  final bool? isPassword;

  /// The controller for working with the widget.
  final TextEditingController? controller;

  /// The validation function or otherwise checking the data for correctness.
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(
      /// ========== [Controller & Validation] ==========
      controller: controller,
      validator: validator,

      /// ========== [Text Type] ==========
      obscureText: isPassword ?? false,
      enableSuggestions: isPassword ?? true,
      autocorrect: isPassword ?? true,

      /// ========== [Input Decoration] ==========
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 13.5,
          horizontal: 16,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: theme.textTheme.titleSmall!.copyWith(
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.normal,
        ),
      ),

      /// ========== [Text Style] ==========
      style: theme.textTheme.titleSmall!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
