import 'package:auto_route/auto_route.dart';
import 'package:bntu_schedule/src/presentations/schedule/schedule.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
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
    );
  }
}
