import 'package:internet_connection_checker/internet_connection_checker.dart';

/// An abstract class for working with the network.
abstract class NetworkInfo {
  /// Returns whether or not connected to the Internet.
  Future<bool> get isConnected;
}

/// Implementation of the abstract class `[NetworkInfo]`.
class NetworkInfoImp implements NetworkInfo {
  NetworkInfoImp(this.connectionChecker);

  /// Singleton for working with the network
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
