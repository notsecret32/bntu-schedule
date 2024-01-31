import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SelectGroupForm extends StatefulWidget {
  const SelectGroupForm({super.key});

  @override
  State<SelectGroupForm> createState() => _SelectGroupFormState();
}

class _SelectGroupFormState extends State<SelectGroupForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          SelectGroupTextField(
            controller: _controller,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Выбрать',
            onPress: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
