import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/colors/light_colors.dart';
import '../../../core/theme/text_theme.dart';
import 'board_text_form_field.dart';

class SelectGroupModal extends ConsumerWidget {
  const SelectGroupModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const BoardTextFormField(),
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
