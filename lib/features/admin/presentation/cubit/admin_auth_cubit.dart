import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/admin/domain/usecases/usecases.dart';
import 'package:bntu_schedule/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'admin_auth_state.dart';

class AdminAuthCubit extends Cubit<AdminAuthState> {
  AdminAuthCubit() : super(AdminAuthInitialState());

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AdminAuthLoggingInState());

      final Either<Failure, UserCredential> admin =
          await sl<LoginUseCase>().call(
        LoginParams(
          email: email,
          password: password,
        ),
      );

      final UserCredential userCredential = admin.fold(
        (Failure error) {
          emit(
            AdminAuthFailureState(
              error: error.toString(),
            ),
          );
          throw Error();
        },
        (UserCredential admin) {
          emit(
            AdminAuthLoggedInState(),
          );
          return admin;
        },
      );
      return userCredential;
    } catch (error) {
      emit(
        AdminAuthFailureState(
          error: error.toString(),
        ),
      );
      throw Error();
    }
  }

  Future<void> logout() async {
    try {
      emit(AdminAuthLoggingOutState());

      final Either<Failure, void> result = await sl<LogoutUseCase>().call(
        NoParams(),
      );

      result.fold(
        (Failure error) {
          emit(
            AdminAuthFailureState(
              error: error.toString(),
            ),
          );
        },
        (_) {
          emit(
            AdminAuthLoggedOutState(),
          );
        },
      );
    } catch (error) {
      emit(
        AdminAuthFailureState(
          error: error.toString(),
        ),
      );
    }
  }
}
