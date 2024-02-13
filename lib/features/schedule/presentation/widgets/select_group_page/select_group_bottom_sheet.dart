import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Custom widget to display using [CustomBottomSheet].
class SelectGroupBottomSheet extends StatelessWidget {
  const SelectGroupBottomSheet({
    super.key,
    this.textFieldController,
    this.onButtonPressed,
    this.enable = true,
  });

  /// Callback function when the button is pressed.
  final Function()? onButtonPressed;

  /// Text controller for a text field.
  final TextEditingController? textFieldController;

  final bool enable;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              SelectGroupTextField(
                controller: textFieldController,
                enable: enable,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: 'Выбрать',
                onPress: onButtonPressed,
                enable: enable,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
