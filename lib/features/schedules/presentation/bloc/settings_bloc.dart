import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/core/error/failure/failure.dart';
import 'package:bntu_schedule/core/usecases/no_params.dart';
import 'package:bntu_schedule/features/schedules/domain/usecases/usecases.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

/// State manager for the page [SettingsPage].
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitialState()) {
    on<SettingsRemoveSelectedGroupEvent>(_removeSelectedGroup);
  }

  /// The method for removing the selected group.
  Future<void> _removeSelectedGroup(
    SettingsEvent event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      // Indicate that the process has begun
      emit(SettingsLoadingState());

      // Calling UseCase to remove the selected group.
      final Either<Failure, void> result =
          await sl<RemoveSelectedGroupUseCase>().call(NoParams());

      // // Unfolding the result
      result.fold(
        // If an error is received
        (Failure error) => emit(
          SettingsFailureState(
            error: error.toString(),
          ),
        ),
        // If everything went well
        (_) => emit(
          SettingsLoadedState(),
        ),
      );
    } catch (error) {
      // Or an unknown error has returned
      emit(SettingsFailureState(error: error.toString()));
    }
  }
}
