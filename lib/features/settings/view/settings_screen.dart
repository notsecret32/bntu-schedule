import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/generated/l10n.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
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
            S.of(context).settings,
            style: theme.textTheme.headlineLarge,
          ),
        ),
        body: Center(
          child: Text(S.of(context).settings),
        ),
      ),
    );
  }
}
