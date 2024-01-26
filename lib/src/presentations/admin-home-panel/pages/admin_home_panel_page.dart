import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/core/constants/routes.dart';
import 'package:bntu_schedule/src/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:bntu_schedule/src/presentations/admin-home-panel/cubit/admin_home_login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AdminHomePanelPage extends StatelessWidget {
  const AdminHomePanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return BlocProvider<AdminHomeLoginCubit>(
      create: (BuildContext context) => sl<AdminHomeLoginCubit>(),
      child: BlocBuilder<AdminHomeLoginCubit, AdminHomeLoginState>(
        builder: (BuildContext context, AdminHomeLoginState state) {
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Админ Панель',
              icon: Icons.exit_to_app,
              onPress: () {
                context.read<AdminHomeLoginCubit>().logout().then(
                      (_) async => await router.navigateNamed(
                        adminLoginPageRouteKey,
                      ),
                    );
              },
            ),
            body: const SafeArea(
              child: Center(
                child: Text('Admin Panel'),
              ),
            ),
          );
        },
      ),
    );
  }
}
