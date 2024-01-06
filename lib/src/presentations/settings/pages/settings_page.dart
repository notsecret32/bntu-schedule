import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter appRouter = AutoRouter.of(context);
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: appRouter.pop,
          ),
          title: Text(
            'Страница Настройки',
            style: theme.textTheme.headlineLarge,
          ),
        ),
        body: const Center(
          child: Text('Страница Настройки'),
        ),
      ),
    );
  }
}
