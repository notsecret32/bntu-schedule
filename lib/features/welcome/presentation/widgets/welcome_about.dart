import 'package:flutter/material.dart';

class WelcomeAbout extends StatelessWidget {
  const WelcomeAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Добро пожаловать!',
            style: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.onSecondary,
            ),
          ),
          Text(
            'БНТУ Расписание - удобный способ просматривать расписание.',
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
