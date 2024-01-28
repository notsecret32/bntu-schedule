import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/core/error/failure/failure.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/welcome/domain/usecases/set_welcome_page_viewed_use_case.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'welcome_actions_state.dart';

class WelcomeActionsCubit extends Cubit<WelcomeActionsState> {
  WelcomeActionsCubit() : super(WelcomeActionsInitialState());

  Future<void> setWelcomePageViewed() async {
    try {
      emit(WelcomeActionsLoadingState());

      final Either<Failure, void> result =
          await sl<SetWelcomePageViewedUseCase>().call(NoParams());

      result.fold(
        (Failure error) => emit(
          WelcomeActionsFailureState(
            error: error.toString(),
          ),
        ),
        (_) => emit(
          WelcomeActionsLoadedState(),
        ),
      );
    } catch (e) {
      emit(WelcomeActionsFailureState(error: e.toString()));
    }
  }
}
