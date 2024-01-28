import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/widgets/custom_button.dart';
import 'package:bntu_schedule/features/welcome/presentation/cubit/welcome_actions_cubit.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final StackRouter router = AutoRouter.of(context);
    return BlocProvider<WelcomeActionsCubit>(
      create: (BuildContext context) => sl<WelcomeActionsCubit>(),
      child: BlocBuilder<WelcomeActionsCubit, WelcomeActionsState>(
        builder: (BuildContext context, WelcomeActionsState state) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CustomButton(
                        text: 'Выбрать группу',
                        textColor: theme.colorScheme.onSurface,
                        backgroundColor: theme.colorScheme.onPrimary,
                        onPress: () async => await _navigateOnClick(
                          context,
                          router,
                          selectGroupPageRouteKey,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        text: 'Войти',
                        backgroundColor: theme.colorScheme.onSecondaryContainer,
                        onPress: () async => await _navigateOnClick(
                          context,
                          router,
                          adminLoginPageRouteKey,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                  Positioned.fill(
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _navigateOnClick(
    BuildContext context,
    StackRouter router,
    String path,
  ) async {
    await context.read<WelcomeActionsCubit>().setWelcomePageViewed();
    await router.pushNamed(path);
  }
}
