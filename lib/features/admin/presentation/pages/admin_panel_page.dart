import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_authentication_cubit.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AdminSchedulePage extends StatelessWidget {
  const AdminSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return BlocProvider<AdminAuthenticationCubit>(
      create: (BuildContext context) => sl<AdminAuthenticationCubit>(),
      child: BlocBuilder<AdminAuthenticationCubit, AdminAuthenticationState>(
        builder: (BuildContext context, AdminAuthenticationState state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Админка (Расписание)',
              icon: Icons.exit_to_app,
              onPress: () {
                context.read<AdminAuthenticationCubit>().logout().then(
                      (_) async => await router.navigateNamed(
                        adminLoginPageRouteKey,
                      ),
                    );
              },
            ),
            body: const SafeArea(
              child: Center(
                child: Text('Admin Schedule Panel'),
              ),
            ),
          );
        },
      ),
    );
  }
}
