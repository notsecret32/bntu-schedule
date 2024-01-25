import 'package:firebase_auth/firebase_auth.dart';

/// An abstract class for working with a remote [FirebaseAuth] data source.
abstract class AuthRemoteDataSource {
  /// The method for logging in.
  Future<UserCredential> login(String email, String password);

  /// Method for logging out.
  Future<void> logout();
}

/// Implementation of the abstract [AuthRemoteDataSource] class
final class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({
    required FirebaseAuth auth,
  }) : _auth = auth;

  /// An instance of the [FirebaseAuth] class for working with authorization.
  final FirebaseAuth _auth;

  @override
  Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    return await _auth.signOut();
  }
}
