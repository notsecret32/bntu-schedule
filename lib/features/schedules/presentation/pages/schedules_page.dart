import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/router/routes_list.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

@RoutePage()
class SchedulesPage extends StatefulWidget {
  const SchedulesPage({
    super.key,
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _selectGroupTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Расписание',
        leadingIcon: Icons.settings,
        onLeadingIconPress: () => context.push('/schedules/settings'),
        actions: <CustomAppBarActionButton>[
          CustomAppBarActionButton(
            icon: Icons.search,
            onPressed: () {
              CustomBottomSheet.showBottomSheet(
                context: context,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SelectGroupBottomSheet(
                    textFieldController: _selectGroupTextController,
                    textFieldValidator: _validateSelectedGroup,
                    onButtonPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.pop();
                        context.go(
                          RoutesList.navigateToSelectedGroup(
                            _selectGroupTextController.text,
                          ),
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const WeekCalendar(),
            const SizedBox(
              height: 16,
            ),
            ScheduleList(
              items: <Widget>[
                ScheduleEmptyItem(
                  text: 'Номер группы: ${widget.groupNumber}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateSelectedGroup(String? value) {
    if (value == null) {
      return 'Это поле не может быть пустым';
    }

    if (value.length < 8) {
      return 'Номер группы должен состоять из 8 цифр';
    }

    return null;
  }
}
