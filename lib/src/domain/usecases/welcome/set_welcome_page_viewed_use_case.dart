import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/core/usecases/usecase.dart';
import 'package:bntu_schedule/src/domain/repositories/repositories.dart';
import 'package:dartz/dartz.dart';

/// Sets the welcome page as viewed.
class SetWelcomePageViewedUseCase extends UseCase<void, NoParams> {
  SetWelcomePageViewedUseCase({
    required WelcomeRepository welcomeRepository,
  }) : _welcomeRepository = welcomeRepository;

  /// Instance of the [WelcomeRepository] class for working with welcome page.
  final WelcomeRepository _welcomeRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _welcomeRepository.setWelcomePageViewed();
  }
}
