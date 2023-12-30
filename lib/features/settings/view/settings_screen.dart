import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter appRouter = AutoRouter.of(context);
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: appRouter.pop,
        ),
        title: Text(
          'Настройки',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: const Center(
        child: Text('Страница Настроек'),
      ),
    );
  }
}
