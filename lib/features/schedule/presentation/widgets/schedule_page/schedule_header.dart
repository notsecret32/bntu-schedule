import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart'
    show CustomAppBar, CustomAppBarActionButton, CustomBottomSheet;
import 'package:bntu_schedule/features/schedule/presentation/bloc/group_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart'
    show SelectGroupBottomSheet;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// TODO: Надо упростить код, ибо пока что это полный треш, реально
// TODO: Сделать поиск группы как отдельный виджет (GroupSearch)
// TODO: Можно попробовать сделать GroupSearch как отдельный виджет с отображением `SnackBar`, а в этом виджете обернуть все это в `BottomSheet`

class ScheduleHeader extends StatefulWidget implements PreferredSizeWidget {
  const ScheduleHeader({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<ScheduleHeader> createState() => _ScheduleHeaderState();
}

class _ScheduleHeaderState extends State<ScheduleHeader> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Расписание',
      leadingIcon: Icons.settings,
      onLeadingIconPress: () => context.pushNamed(
        RoutesList.schedulesSettingsPage.name,
      ),
      actions: <CustomAppBarActionButton>[
        CustomAppBarActionButton(
          icon: Icons.search,
          onPressed: () => _showModalBottomSheet(context),
        ),
      ],
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SelectGroupBottomSheet(
          textFieldController: _controller,
          onButtonPressed: () async => await _onSelectButtonPressed(context),
        ),
      ),
    );
  }

  Future<void> _onSelectButtonPressed(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context
          .read<GroupBloc>()
          .add(SelectGroupEvent(groupNumber: _controller.text));
    }
  }
}
