import 'package:bntu_schedule/features/welcome/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const WelcomeBody(),
    );
  }
}
