import 'package:bntu_schedule/src/core/error/error.dart';

/// The subtype of the class [Failure] indicates problems in the network.
///
/// For example, no internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// The subtype of the class [NetworkFailure] indicates that there is no
/// Internet connection.
class NoInternetConnectionFailure extends NetworkFailure {
  const NoInternetConnectionFailure(super.message);
}
