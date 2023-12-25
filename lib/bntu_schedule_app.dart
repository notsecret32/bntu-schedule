import 'package:flutter/material.dart';

import 'features/schedule/view/schedule_screen.dart';

class BntuScheduleApp extends StatelessWidget {
  const BntuScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'БНТУ Расписание',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(71, 135, 232, 0),
        ),
        useMaterial3: true,
      ),
      home: ScheduleScreen(),
    );
  }
}
