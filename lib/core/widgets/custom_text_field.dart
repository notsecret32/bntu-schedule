import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The wrapper over the [TextFormField] is used to minimize repetitive code.
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword,
    this.controller,
    this.validator,
    this.textFilter,
    this.textMaxLength,
    this.enable = true,
    this.inputType = TextInputType.number,
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

  /// Text filter for different characters.
  final TextInputFormatter? textFilter;

  /// Indicates whether this widget is active or not.
  final bool enable;

  /// Type of keyboard.
  final TextInputType inputType;

  /// Maximum number of characters.
  final int? textMaxLength;

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
      readOnly: !enable,
      keyboardType: inputType,

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

      /// ========== [Input Formatters] ==========
      inputFormatters: <TextInputFormatter>[
        textFilter ?? FilteringTextInputFormatter.singleLineFormatter,
        LengthLimitingTextInputFormatter(textMaxLength),
      ],

      /// ========== [Text Style] ==========
      style: theme.textTheme.titleSmall!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
