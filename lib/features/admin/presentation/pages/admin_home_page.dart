import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_auth_cubit.dart';
import 'package:bntu_schedule/features/admin/presentation/widgets/admin_home_body.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminAuthCubit>(
      create: (BuildContext context) => sl<AdminAuthCubit>(),
      child: BlocListener<AdminAuthCubit, AdminAuthState>(
        listener: (BuildContext context, AdminAuthState state) {
          if (state is AdminAuthLoggedOutState) {
            context.goNamed(
              RoutesList.adminAuthenticationPage.name,
            );
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Админ Панель',
            leadingIcon: Icons.exit_to_app,
            onLeadingIconPress: () async =>
                await _onLogoutButtonPressed(context),
          ),
          body: const AdminHomeBody(),
        ),
      ),
    );
  }

  Future<void> _onLogoutButtonPressed(BuildContext context) async {
    await context.read<AdminAuthCubit>().logout();
  }
}
