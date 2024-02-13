part of 'schedule_bloc.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => <Object>[];
}

final class ScheduleInitialState extends ScheduleState {}

final class ScheduleLoadingState extends ScheduleState {}

final class ScheduleLoadedState extends ScheduleState {
  const ScheduleLoadedState({
    required this.schedule,
  });

  final GroupScheduleEntity schedule;

  @override
  List<GroupScheduleEntity> get props => <GroupScheduleEntity>[schedule];
}

final class ScheduleFailureState extends ScheduleState {
  const ScheduleFailureState({
    required this.message,
  });

  final String message;

  @override
  List<String> get props => <String>[message];
}
