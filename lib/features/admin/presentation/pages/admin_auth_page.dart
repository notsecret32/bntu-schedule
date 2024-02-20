import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/core/widgets/custom_snack_bar.dart';
import 'package:bntu_schedule/features/admin/presentation/cubit/admin_auth_cubit.dart';
import 'package:bntu_schedule/features/admin/presentation/widgets/admin_auth_form.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminAuthPage extends StatelessWidget {
  const AdminAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminAuthCubit>(
      create: (_) => sl<AdminAuthCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Вход',
          leadingIcon: Icons.arrow_back,
          onLeadingIconPress: () => context.goNamed(
            RoutesList.selectGroupPage.name,
          ),
        ),
        body: BlocListener<AdminAuthCubit, AdminAuthState>(
          listener: (BuildContext context, AdminAuthState state) {
            if (state is AdminAuthFailureState) {
              CustomSnackBarViewer.showSnackBar(
                context: context,
                text: 'Такого пользователя не существует!',
                isError: true,
              );
            }
          },
          child: const AdminAuthForm(),
        ),
      ),
    );
  }
}
