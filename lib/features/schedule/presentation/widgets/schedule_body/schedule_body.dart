import 'package:bntu_schedule/core/enums/week_day_enum.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_of_year/week_of_year.dart';

class ScheduleBody extends StatefulWidget {
  const ScheduleBody({
    super.key,
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  State<ScheduleBody> createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<ScheduleBody> {
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _getScheduleForGroup();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 10,
      onRefresh: () async => await _getScheduleForGroup(),
      child: Column(
        children: <Widget>[
          WeekCalendar(
            onDayChange: (DateTime selectedDay) => setState(
              () => _selectedDay = selectedDay,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: BlocBuilder<ScheduleBloc, ScheduleState>(
              buildWhen: (_, ScheduleState current) =>
                  current is ScheduleLoadedState,
              builder: (BuildContext context, ScheduleState state) {
                if (state is ScheduleLoadedState) {
                  return ScheduleViewer(
                    schedule: state.schedule,
                    weekday: WeekDayEnum.values[_selectedDay.weekday - 1],
                    weekType: _selectedDay.weekOfYear % 2,
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getScheduleForGroup() async {
    context.read<ScheduleBloc>().add(
          LoadScheduleEvent(
            groupNumber: widget.groupNumber,
          ),
        );
  }
}
