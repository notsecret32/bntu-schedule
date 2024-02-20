import 'package:bntu_schedule/features/admin/presentation/cubit/admin_auth_cubit.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './admin_home_view.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminAuthCubit>(
      create: (BuildContext context) => sl<AdminAuthCubit>(),
      child: const AdminHomeView(),
    );
  }
}
