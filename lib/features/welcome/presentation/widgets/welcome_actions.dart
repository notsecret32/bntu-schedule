import 'package:bntu_schedule/features/welcome/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            WelcomeActionBody(),
            WelcomeActionButtons(),
          ],
        ),
      ),
    );
  }
}
