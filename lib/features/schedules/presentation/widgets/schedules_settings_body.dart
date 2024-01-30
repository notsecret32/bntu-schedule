import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SchedulesSettingsBody extends StatelessWidget {
  const SchedulesSettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: const Column(
          children: <Widget>[
            CustomButton(
              text: 'Просто кнопка',
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
