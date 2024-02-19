import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/schedule/domain/usecases/group/group.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'group_event.dart';
part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc() : super(GroupInitialState()) {
    on<SelectGroupEvent>(_selectGroup);
    on<GetSelectedGroupNumberEvent>(_getSelectedGroupNumber);
    on<RemoveSelectedGroupNumberEvent>(_removeSelectedGroupNumber);
  }

  Future<void> _selectGroup(
    SelectGroupEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupLoadingState());

      final Either<Failure, void> result =
          await sl<SelectGroupNumberUseCase>().call(
        SelectGroupNumberParams(
          groupNumber: event.groupNumber,
        ),
      );

      result.fold(
        (Failure error) => emit(
          GroupFailureState(
            message: error.message,
          ),
        ),
        (_) => emit(
          GroupLoadedState(),
        ),
      );
    } catch (e) {
      emit(GroupFailureState(message: e.toString()));
    }
  }

  Future<void> _getSelectedGroupNumber(
    GetSelectedGroupNumberEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupLoadingState());

      final Either<Failure, void> result =
          await sl<GetSelectedGroupNumberUseCase>().call(NoParams());

      result.fold(
        (Failure error) => emit(
          GroupFailureState(
            message: error.message,
          ),
        ),
        (_) => emit(
          GroupLoadedState(),
        ),
      );
    } catch (e) {
      emit(GroupFailureState(message: e.toString()));
    }
  }

  Future<void> _removeSelectedGroupNumber(
    RemoveSelectedGroupNumberEvent event,
    Emitter<GroupState> emit,
  ) async {
    try {
      emit(GroupLoadingState());

      final Either<Failure, void> result =
          await sl<RemoveSelectedGroupNumberUseCase>().call(NoParams());

      result.fold(
        (Failure error) => emit(
          GroupFailureState(
            message: error.message,
          ),
        ),
        (_) => emit(
          GroupLoadedState(),
        ),
      );
    } catch (e) {
      emit(GroupFailureState(message: e.toString()));
    }
  }
}
