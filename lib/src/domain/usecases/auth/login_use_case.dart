import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/core/usecases/usecase.dart';
import 'package:bntu_schedule/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// UseCase, used to authorize the administrator in the system.
class LoginUseCase extends UseCase<UserCredential, LoginParams> {
  LoginUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  /// Instance of the [AuthRepository] class for working with authorization.
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserCredential>> call(LoginParams params) async {
    return await _authRepository.login(params.email, params.password);
  }
}

/// A set of parameters for [LoginUseCase].
///
/// It consists of an email and a password.
class LoginParams extends Equatable {
  const LoginParams({
    required this.email,
    required this.password,
  });

  /// Admin email.
  final String email;

  /// Admin password
  final String password;

  @override
  List<Object?> get props => <Object?>[email, password];
}
