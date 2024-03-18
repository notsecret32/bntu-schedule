import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'board_text_form_field.dart';

class SelectGroupModalForm extends ConsumerStatefulWidget {
  const SelectGroupModalForm({super.key});

  @override
  ConsumerState<SelectGroupModalForm> createState() => _SelectGroupFormState();
}

class _SelectGroupFormState extends ConsumerState<SelectGroupModalForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BoardTextFormField(
            controller: _controller,
            validator: (String? value) => _validateTextFormField(value),
            onChanged: (String value) => setState(() {
              _controller.text = value;
            }),
          ),
          const SizedBox(
            height: 16,
          ),
          PlatformElevatedButton(
            onPressed:
                _formKey.currentState?.validate() ?? false ? () {} : null,
            child: const Text(
              'Войти',
            ),
          ),
        ],
      ),
    );
  }

  String? _validateTextFormField(String? value) {
    if (value!.isEmpty) {
      return null;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Номер группы может состоять только из цифр.';
    }

    if (value.length < 8) {
      return 'Номер группы состоит из 8 цифр';
    }

    return null;
  }
}
