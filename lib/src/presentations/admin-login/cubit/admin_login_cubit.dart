import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/domain/usecases/auth/login_use_case.dart';
import 'package:bntu_schedule/src/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'admin_login_state.dart';

class AdminLoginCubit extends Cubit<AdminLoginState> {
  AdminLoginCubit() : super(AdminLoginInitialState());

  Future<UserCredential> login(String email, String password) async {
    try {
      emit(AdminLoginLoadingState());

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
            AdminLoginFailureState(
              error: error.toString(),
            ),
          );
          throw Error();
        },
        (UserCredential admin) {
          emit(
            AdminLoginLoadedState(),
          );
          return admin;
        },
      );
      return userCredential;
    } catch (error) {
      emit(
        AdminLoginFailureState(
          error: error.toString(),
        ),
      );
      throw Error();
    }
  }
}
