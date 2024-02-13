part of 'schedule_bloc.dart';

sealed class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object> get props => <Object>[];
}

final class LoadScheduleEvent extends ScheduleEvent {
  const LoadScheduleEvent({
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  List<Object> get props => <Object>[groupNumber];
}
