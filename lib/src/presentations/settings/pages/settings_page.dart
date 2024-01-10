import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter appRouter = AutoRouter.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Настройки',
          icon: Icons.arrow_back,
          onPress: appRouter.pop,
        ),
        body: const Center(
          child: Text('Страница Настройки'),
        ),
      ),
    );
  }
}
