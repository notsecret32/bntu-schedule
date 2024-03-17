import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../core/theme/colors/light_colors.dart';
import '../../../core/theme/text_theme.dart';

class LoginModal extends StatelessWidget {
  const LoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height - 54,
      decoration: const BoxDecoration(
        color: lightBackgroundPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 28,
                    bottom: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Введите номер группы',
                        style: textTheme.title1,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Номер группы можно узнать в зачетной книжке, либо на карточке студента.',
                        style: textTheme.subheadlineRegular.copyWith(
                          color: lightLabelSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                PlatformTextFormField(
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
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: double.infinity,
              child: PlatformElevatedButton(
                onPressed: () => log('logging in to the system...'),
                child: const Text(
                  'Войти',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
