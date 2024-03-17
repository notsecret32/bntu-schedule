import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../core/theme/colors/light_colors.dart';
import '../../../core/theme/text_theme.dart';

class BoardTextFormField extends StatelessWidget {
  const BoardTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return PlatformTextFormField(
      autofocus: true,
      material: (_, __) => MaterialTextFormFieldData(
        style: textTheme.body,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Номер группы',
          hintStyle: textTheme.body.copyWith(
            color: lightLabelSecondary,
          ),
          focusColor: lightLabelQuaternary,
          contentPadding: const EdgeInsets.all(16),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightLabelQuaternary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightLabelQuaternary,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
