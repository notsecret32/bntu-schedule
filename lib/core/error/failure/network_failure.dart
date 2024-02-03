import 'package:bntu_schedule/core/error/error.dart';

/// The subtype of the class [Failure] indicates problems in the network.
///
/// For example, no internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
