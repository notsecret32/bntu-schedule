import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:bntu_schedule/features/schedule/domain/usecases/schedule/get_schedule_by_group_number_use_case.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(ScheduleInitialState()) {
    on<LoadScheduleEvent>(_loadSchedule);
  }

  Future<void> _loadSchedule(
    LoadScheduleEvent event,
    Emitter<ScheduleState> emit,
  ) async {
    try {
      emit(ScheduleLoadingState());

      final Either<Failure, GroupScheduleEntity> result =
          await sl<GetScheduleByGroupNumberUseCase>().call(event.groupNumber);

      result.fold(
        (Failure e) => emit(
          ScheduleFailureState(
            message: e.toString(),
          ),
        ),
        (GroupScheduleEntity schedule) => emit(
          ScheduleLoadedState(schedule: schedule),
        ),
      );
    } catch (e) {
      emit(ScheduleFailureState(message: e.toString()));
    }
  }
}
