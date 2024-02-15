import 'package:bntu_schedule/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectGroupTextField extends StatelessWidget {
  const SelectGroupTextField({
    super.key,
    this.controller,
    this.enable = true,
  });

  final TextEditingController? controller;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: 'Введите номер группы',
      textFilter: FilteringTextInputFormatter.digitsOnly,
      textMaxLength: 8,
      validator: _validateSelectedGroup,
    );
  }

  String? _validateSelectedGroup(String? value) {
    if (value == null) {
      return 'Это поле не может быть пустым';
    }

    if (value.length < 8) {
      return 'Номер группы должен состоять из 8 цифр';
    }

    return null;
  }
}
