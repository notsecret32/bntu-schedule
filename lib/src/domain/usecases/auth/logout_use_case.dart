import 'package:bntu_schedule/src/core/error/error.dart';
import 'package:bntu_schedule/src/core/usecases/usecase.dart';
import 'package:bntu_schedule/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

/// UseCase, used to log the admin out of the system.
class LogoutUseCase extends UseCase<void, NoParams> {
  LogoutUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  /// Instance of the [AuthRepository] class for working with authorization.
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.logout();
  }
}
