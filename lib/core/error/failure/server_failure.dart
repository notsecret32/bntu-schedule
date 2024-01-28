import 'package:bntu_schedule/core/error/failure/failure.dart';

/// The subtype of the [Failure] class indicates incorrect operation with the server.
///
/// For example, when trying to get data from the server, there was no data.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
