import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/welcome/presentation/cubit/welcome_actions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WelcomeActionButtons extends StatelessWidget {
  const WelcomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CustomButton(
          text: 'Выбрать группу',
          textColor: theme.colorScheme.onSurface,
          backgroundColor: theme.colorScheme.onPrimary,
          onPress: () async => await _onButtonPressed(
            context,
            RoutesList.selectGroupPage.name,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          text: 'Войти',
          backgroundColor: theme.colorScheme.onSecondaryContainer,
          onPress: () async => await _onButtonPressed(
            context,
            RoutesList.adminAuthenticationPage.name,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Future<void> _onButtonPressed(
    BuildContext context,
    String path,
  ) async {
    await context.read<WelcomeActionsCubit>().setWelcomePageViewed();
    context.goNamed(path);
  }
}
