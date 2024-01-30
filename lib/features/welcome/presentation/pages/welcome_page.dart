import 'package:bntu_schedule/features/welcome/presentation/cubit/welcome_actions_cubit.dart';
import 'package:bntu_schedule/features/welcome/presentation/pages/pages.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeActionsCubit>(
      create: (BuildContext context) => sl<WelcomeActionsCubit>(),
      child: const WelcomeView(),
    );
  }
}
