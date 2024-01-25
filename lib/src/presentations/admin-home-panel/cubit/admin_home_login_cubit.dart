import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/core/usecases/no_params.dart';
import 'package:bntu_schedule/src/domain/usecases/auth/logout_use_case.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'admin_home_login_state.dart';

class AdminHomeLoginCubit extends Cubit<AdminHomeLoginState> {
  AdminHomeLoginCubit() : super(AdminHomeLoginInitialState());

  Future<void> logout() async {
    try {
      emit(AdminHomeLoginLoadingState());

      final Either<Failure, void> result = await sl<LogoutUseCase>().call(
        NoParams(),
      );

      result.fold(
        (Failure error) {
          emit(
            AdminHomeLoginFailureState(
              error: error.toString(),
            ),
          );
        },
        (_) {
          emit(
            AdminHomeLoginLoadedState(),
          );
        },
      );
    } catch (error) {
      emit(
        AdminHomeLoginFailureState(
          error: error.toString(),
        ),
      );
    }
  }
}
