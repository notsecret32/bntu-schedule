import 'package:bntu_schedule/core/enums/week_day_enum.dart';
import 'package:bntu_schedule/features/schedule/presentation/bloc/schedule_bloc.dart';
import 'package:bntu_schedule/features/schedule/presentation/widgets/schedule_viewer/schedule_viewer.dart';
import 'package:custom_widgets/widgets.dart' show CustomWeeklyCalendar;
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
          CustomWeeklyCalendar(
            onDayChanged: (DateTime selectedDay) => setState(
              () => _selectedDay = selectedDay,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: BlocBuilder<ScheduleBloc, ScheduleState>(
              builder: (BuildContext context, ScheduleState state) {
                if (state is ScheduleLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ScheduleLoadedState) {
                  return ScheduleViewer(
                    schedule: state.schedule,
                    weekday: WeekDayEnum.values[_selectedDay.weekday - 1],
                    weekType: _selectedDay.weekOfYear % 2 == 0 ? 2 : 1,
                  );
                }

                return ScheduleViewer.empty();
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
