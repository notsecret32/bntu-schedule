import 'package:bntu_schedule/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// An abstract class for working with authorization.
abstract class AdminAuthenticationRepository {
  /// The method for logging in to the system.
  Future<Either<Failure, UserCredential>> login(String email, String password);

  /// The method for logging out from the system.
  Future<Either<Failure, void>> logout();
}
