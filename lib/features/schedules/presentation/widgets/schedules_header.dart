import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SchedulesHeader extends StatefulWidget implements PreferredSizeWidget {
  const SchedulesHeader({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<SchedulesHeader> createState() => _SchedulesHeaderState();
}

class _SchedulesHeaderState extends State<SchedulesHeader> {
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
          onButtonPressed: () => _onSelectButtonPressed(context),
        ),
      ),
    );
  }

  void _onSelectButtonPressed(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Hiding the Bottom Sheet
      context.pop();

      // TODO: There should be a state management here
      context.go(
        RoutesList.navigateToSelectedGroup(
          _controller.text,
        ),
      );
    }
  }
}
