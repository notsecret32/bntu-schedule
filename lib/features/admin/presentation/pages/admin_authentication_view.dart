import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/admin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminAuthenticationView extends StatelessWidget {
  const AdminAuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Вход',
        leadingIcon: Icons.arrow_back,
        onLeadingIconPress: () => context.goNamed(
          RoutesList.schedulesSelectGroupPage.name,
        ),
      ),
      body: const AdminAuthenticationForm(),
    );
  }
}
