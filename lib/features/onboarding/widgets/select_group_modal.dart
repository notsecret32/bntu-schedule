import 'package:flutter/material.dart';

import '../../../core/theme/colors/light_colors.dart';
import '../../../core/theme/text_theme.dart';
import '../../../core/widgets/modal.dart';
import 'select_group_modal_form.dart';

class SelectGroupModal extends StatelessWidget {
  const SelectGroupModal({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Modal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _createModalHeader(textTheme: textTheme),
          const SelectGroupModalForm(),
        ],
      ),
    );
  }

  Widget _createModalHeader({
    required TextTheme textTheme,
  }) {
    return Container(
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
    );
  }
}
