import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectGroupTextField extends StatelessWidget {
  const SelectGroupTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
