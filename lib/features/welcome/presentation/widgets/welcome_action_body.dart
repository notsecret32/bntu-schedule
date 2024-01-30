import 'package:flutter/material.dart';

class WelcomeActionBody extends StatelessWidget {
  const WelcomeActionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Positioned.fill(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Что дальше?',
              style: theme.textTheme.labelLarge!.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
            ),
            Text(
              'Выберите группу, если хотите узнать расписание.',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Или войдите как администратор, чтобы его редактировать.',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
