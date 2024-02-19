import 'package:bntu_schedule/core/error/failure.dart';
import 'package:dartz/dartz.dart';

/// An abstract repository class for working with the welcome page.
abstract class WelcomeRepository {
  /// Determines that the welcome page has been viewed.
  Future<Either<Failure, void>> setWelcomePageViewed();
}
