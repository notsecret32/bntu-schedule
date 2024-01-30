import 'package:bntu_schedule/features/schedules/presentation/bloc/select_group_bloc.dart';
import 'package:bntu_schedule/features/schedules/presentation/pages/pages.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectGroupBloc>(
      create: (BuildContext context) => sl<SelectGroupBloc>(),
      child: const SelectGroupView(),
    );
  }
}
