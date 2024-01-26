import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/core/network/network_info.dart';
import 'package:bntu_schedule/src/data/datasources/auth/auth.dart';
import 'package:bntu_schedule/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Implementation of the abstract [AuthRepository] class
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required NetworkInfo networkInfo,
    required AuthRemoteDataSource remoteDataSource,
  })  : _networkInfo = networkInfo,
        _remoteDataSource = remoteDataSource;

  /// An instance of the [NetworkInfo] class
  /// for working with network.
  final NetworkInfo _networkInfo;

  /// An instance of the [AuthRemoteDataSource] class
  /// for working with remote data.
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, UserCredential>> login(
    String email,
    String password,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final UserCredential admin =
            await _remoteDataSource.login(email, password);
        return Right<Failure, UserCredential>(admin);
      } catch (e) {
        return Left<Failure, UserCredential>(
          ServerFailure(
            '''
            Something went wrong when trying to log in to the admin panel...
            
            Error: $e
            ''',
          ),
        );
      }
    }

    return const Left<Failure, UserCredential>(
      NoInternetConnectionFailure('No Internet connection'),
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.logout();
        return const Right<Failure, void>(null);
      } catch (e) {
        return Left<Failure, void>(
          ServerFailure(
            '''
            Something went wrong when trying to log in to the admin panel...
            
            Error: $e
            ''',
          ),
        );
      }
    }

    return const Left<Failure, void>(
      NoInternetConnectionFailure('No Internet connection'),
    );
  }
}
