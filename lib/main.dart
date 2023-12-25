import 'package:flutter/material.dart';

void main() {
  runApp(const BntuScheduleApp());
}

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
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Страница Расписание'),
        ),
      ),
    );
  }
}
