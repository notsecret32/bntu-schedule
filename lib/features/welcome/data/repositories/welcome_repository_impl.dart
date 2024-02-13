import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/features/welcome/data/datasources/welcome_local_data_source.dart';
import 'package:bntu_schedule/features/welcome/domain/repositories/welcome_repository.dart';
import 'package:dartz/dartz.dart';

/// Implementation of the [WelcomeRepository] abstract class.
class WelcomeRepositoryImpl extends WelcomeRepository {
  WelcomeRepositoryImpl({
    required WelcomeLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  /// An instance of the [WelcomeLocalDataSource] class
  /// for working with local data.
  final WelcomeLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, void>> setWelcomePageViewed() async {
    try {
      await _localDataSource.setWelcomePageViewed();
      return const Right<Failure, void>(null);
    } catch (e) {
      return const Left<Failure, void>(
        Failure(
          'Something went wrong when trying to indicate that the welcome page was viewed',
        ),
      );
    }
  }
}
