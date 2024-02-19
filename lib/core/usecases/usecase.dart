import 'package:bntu_schedule/core/error/failure.dart';
import 'package:dartz/dartz.dart';

export 'no_params.dart';

/// An abstract class responsible for performing specific business operations,
/// interacting with the outside world through the `Data` layer and interacting
/// with the `Presentation` layer through the `Interface`.
///
/// Data validation takes place here, some comparisons, calculations and etc.
abstract class UseCase<Type, Params> {
  /// Calls [UseCase] with the passed parameters.
  Future<Either<Failure, Type>> call(Params params);
}
