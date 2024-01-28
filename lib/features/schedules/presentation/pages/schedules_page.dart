import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/widgets/widgets.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Расписание',
        leadingIcon: Icons.settings,
        onLeadingIconPress: () async => await router.navigateNamed(
          homeSettingsPageRouteKey,
        ),
        actions: <CustomAppBarActionButton>[
          CustomAppBarActionButton(
            icon: Icons.search,
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            WeekCalendar(),
            SizedBox(
              height: 16,
            ),
            ScheduleList(),
          ],
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        child: Container(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                CustomTextField(
                  hintText: 'Введите номер группы',
                  textFilter: FilteringTextInputFormatter.digitsOnly,
                  textMaxLength: 8,
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomButton(text: 'Выбрать'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
