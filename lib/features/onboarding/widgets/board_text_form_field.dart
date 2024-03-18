import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../core/theme/colors/light_colors.dart';
import '../../../core/theme/text_theme.dart';

class BoardTextFormField extends StatelessWidget {
  const BoardTextFormField({
    super.key,
    this.maxLength = 8,
    this.controller,
    this.onChanged,
    this.validator,
  });

  final int? maxLength;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return PlatformTextFormField(
      // ========== [Validation] ==========
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      onChanged: onChanged,

      // ========== [Behavior] ==========
      autofocus: true,

      // ========== [Material Style] ==========
      material: (_, __) => MaterialTextFormFieldData(
        style: textTheme.body,
        keyboardType: TextInputType.number,

        // ========== [Decoration] ==========
        decoration: InputDecoration(
          // ========== [Input] ==========
          contentPadding: const EdgeInsets.all(16),

          // ========== [Hint Style] ==========
          hintText: 'Номер группы',
          hintStyle: textTheme.body.copyWith(
            color: lightLabelSecondary,
          ),

          // ========== [Border Style] ==========
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightLabelQuaternary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),

          // ========== [Focused Border Style] ==========
          focusColor: lightLabelQuaternary,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightLabelQuaternary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),

          // ========== [Error Style] ==========
          errorMaxLines: 3,
        ),
      ),
    );
  }
}
