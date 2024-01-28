import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/core/error/error.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/schedules/domain/entities/group_number_entity.dart';
import 'package:bntu_schedule/features/schedules/domain/usecases/get_all_groups_number_use_case.dart';
import 'package:bntu_schedule/features/schedules/domain/usecases/set_group_number_use_case.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'select_group_event.dart';
part 'select_group_state.dart';

/// State manager for the [SelectGroupPage].
class SelectGroupBloc extends Bloc<SelectGroupEvent, SelectGroupState> {
  SelectGroupBloc() : super(SelectGroupInitialState()) {
    on<SelectGroupLoadEvent>(_getAllGroupsNumber);
    on<SelectGroupNumberEvent>(_setGroupNumber);
  }

  /// Calls [UseCase] to get a list of all available groups.
  Future<void> _getAllGroupsNumber(
    SelectGroupLoadEvent event,
    Emitter<SelectGroupState> emit,
  ) async {
    try {
      // The loading of available groups has started
      emit(SelectGroupLoadingState());

      // Get the result of executing UseCase
      final Either<Failure, List<GroupNumberEntity>> groupsNumber =
          await sl<GetAllGroupsNumberUseCase>().call(NoParams());

      // Unfolding the received response
      groupsNumber.fold(
        // If an error is received
        (Failure error) => emit(
          SelectGroupFailureState(
            error: error.toString(),
          ),
        ),
        // If the data is received
        (List<GroupNumberEntity> groupsNumber) => emit(
          SelectGroupLoadedState(
            groups: groupsNumber,
          ),
        ),
      );
    } catch (error) {
      // Or an unknown error has returned
      emit(SelectGroupFailureState(error: error.toString()));
    }
  }

  /// Calls [UseCase] to select a group.
  Future<void> _setGroupNumber(
    SelectGroupNumberEvent event,
    Emitter<SelectGroupState> emit,
  ) async {
    try {
      // The loading of available groups has started
      emit(SelectGroupLoadingState());

      // Selecting the group that was transferred to the `event`
      final Either<Failure, void> result =
          await sl<SetGroupNumberUseCase>().call(
        SetGroupNumberParams(
          number: event.number,
        ),
      );

      // Unfolding the received response
      result.fold(
        // If an error is received
        (Failure error) => emit(
          SelectGroupFailureState(
            error: error.toString(),
          ),
        ),
        // If everything went well
        (_) => emit(
          SelectGroupNumberSelected(),
        ),
      );
    } catch (error) {
      // Or an unknown error has returned
      emit(SelectGroupFailureState(error: error.toString()));
    }
  }
}
