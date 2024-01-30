import 'package:bntu_schedule/features/admin/presentation/cubit/admin_authentication_cubit.dart';
import 'package:bntu_schedule/features/admin/presentation/pages/pages.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminSchedulePage extends StatelessWidget {
  const AdminSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminAuthenticationCubit>(
      create: (BuildContext context) => sl<AdminAuthenticationCubit>(),
      child: const AdminPanelView(),
    );
  }
}
