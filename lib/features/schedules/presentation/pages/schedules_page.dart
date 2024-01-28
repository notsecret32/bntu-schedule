import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/core/constants/routes.dart';
import 'package:bntu_schedule/core/widgets/custom_app_bar.dart';
import 'package:bntu_schedule/features/schedules/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SchedulesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StackRouter router = AutoRouter.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Расписание',
        icon: Icons.settings,
        onPress: () async => await router.navigateNamed(
          homeSettingsPageRouteKey,
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            WeekCalendar(),
            SizedBox(
              height: 16,
            ),
            ScheduleList(
              items: <Widget>[
                ScheduleItem(
                  time: '9:55 - 11:30',
                  type: 'Практ. занятие',
                  title: 'Системное программирование',
                  teacher: 'Бородуля А. В.',
                  classroom: 'к. 11б, каб. 214',
                  isActive: true,
                ),
                ScheduleItem(
                  time: '11:40 - 13:15',
                  type: 'Лекция',
                  title: 'Базы данных',
                  teacher: 'Куприянов А. Б.',
                  classroom: 'к. 1, каб. 405',
                ),
                ScheduleItem(
                  time: '13:55 - 15:30',
                  type: 'Практ. занятие',
                  title: 'Физическая культура',
                  teacher: 'Буцкевич Л.Н.',
                  classroom: 'Стадион',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
