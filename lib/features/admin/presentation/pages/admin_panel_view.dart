import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_authentication_cubit.dart';
import 'package:bntu_schedule/features/admin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminPanelView extends StatelessWidget {
  const AdminPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Админ Панель',
        leadingIcon: Icons.exit_to_app,
        onLeadingIconPress: () => _onLogoutButtonPressed(context),
      ),
      body: const AdminPanelBody(),
    );
  }

  Future<void> _onLogoutButtonPressed(BuildContext context) async {
    await context.read<AdminAuthenticationCubit>().logout();
    context.goNamed(
      RoutesList.adminAuthenticationPage.name,
    );
  }
}
