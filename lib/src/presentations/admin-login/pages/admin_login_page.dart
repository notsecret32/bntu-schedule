import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Вход',
        icon: Icons.arrow_back,
        onPress: () async => await router.pop(),
      ),
      body: const Center(
        child: Text(
          'Admin Login',
        ),
      ),
    );
  }
}
