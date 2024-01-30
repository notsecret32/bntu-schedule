import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Custom widget to display using [CustomBottomSheet].
class SelectGroupBottomSheet extends StatelessWidget {
  const SelectGroupBottomSheet({
    super.key,
    this.onButtonPressed,
    this.textFieldController,
    this.textFieldValidator,
  });

  /// Callback function when the button is pressed.
  final Function()? onButtonPressed;

  /// Text controller for a text field.
  final TextEditingController? textFieldController;

  /// A method for validating a text field.
  final String? Function(String? value)? textFieldValidator;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CustomTextField(
                controller: textFieldController,
                hintText: 'Введите номер группы',
                textFilter: FilteringTextInputFormatter.digitsOnly,
                textMaxLength: 8,
                validator: textFieldValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: 'Выбрать',
                onPress: onButtonPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
