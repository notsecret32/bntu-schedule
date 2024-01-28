import 'package:bntu_schedule/core/error/error.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/admin/domain/repositories/admin_authentication_repository.dart';
import 'package:dartz/dartz.dart';

/// UseCase, used to log the admin out of the system.
class LogoutUseCase extends UseCase<void, NoParams> {
  LogoutUseCase({
    required AdminAuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  /// Instance of the [AdminAuthenticationRepository] class for working with authorization.
  final AdminAuthenticationRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _authRepository.logout();
  }
}
