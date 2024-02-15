import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/group_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/select_group_body/select_group_body.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GroupBloc>(
      create: (BuildContext context) => sl<GroupBloc>(),
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'Выбор группы',
        ),
        body: SelectGroupBody(),
      ),
    );
  }
}
