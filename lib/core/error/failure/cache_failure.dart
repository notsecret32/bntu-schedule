import 'package:bntu_schedule/core/error/failure/failure.dart';

/// The subtype of the [Failure] class indicates incorrect operation with the cache.
///
/// For example, there is no data in the cache when trying to get it.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}
