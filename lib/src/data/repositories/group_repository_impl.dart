import 'package:bntu_schedule/src/core/error/error.dart';
import 'package:bntu_schedule/src/core/network/network_info.dart';
import 'package:bntu_schedule/src/data/datasources/group/group.dart';
import 'package:bntu_schedule/src/data/models/group_number_model.dart';
import 'package:bntu_schedule/src/domain/entities/group_number_entity.dart';
import 'package:bntu_schedule/src/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

/// Implementation of the abstract class [GroupRepository].
class GroupRepositoryImpl extends GroupRepository {
  GroupRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// An instance of the [GroupRemoteDataSource] class
  /// for working with remote data.
  final GroupRemoteDataSource remoteDataSource;

  /// An instance of the [GroupLocalDataSource] class
  /// for working with local data.
  final GroupLocalDataSource localDataSource;

  /// An instance of the [GroupLocalDataSource] class
  /// for working with network.
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> setGroupNumber(String number) async {
    try {
      // Calling the method that will save the selected group in the cache.
      await localDataSource.setGroupNumber(number);

      // Return a result in which we say that everything is fine.
      return const Right<Failure, void>(null);
    } on CacheException {
      // Return an error with the text.
      return const Left<Failure, void>(
        CacheFailure(
          'The selected group could not be added to the cache',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> removeSelectedGroup() async {
    try {
      // Calling the method that will remove the selected group in the cache.
      await localDataSource.removeSelectedGroup();

      // Return a result in which we say that everything is fine.
      return const Right<Failure, void>(null);
    } on CacheFailure {
      // Return an error with the text.
      return const Left<Failure, void>(
        NoDataInCacheFailure(
          'You have not selected a group',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<GroupNumberEntity>>> getAllGroupsNumber() async {
    // If there is an Internet connection
    if (await networkInfo.isConnected) {
      try {
        // Calling a method that returns a list of available groups.
        final List<GroupNumberModel> remoteGroups =
            await remoteDataSource.getAllGroupsNumber();

        // Return a result in which we say that everything is fine.
        return Right<Failure, List<GroupNumberEntity>>(remoteGroups);
      } on ServerException {
        // Return an error with the text.
        return const Left<Failure, List<GroupNumberEntity>>(
          ServerFailure(
            "Couldn't get a list of group numbers",
          ),
        );
      }
    }

    // If there is no Internet connection, return an error.
    return const Left<Failure, List<GroupNumberEntity>>(
      NoInternetConnectionFailure(
        'No internet connection',
      ),
    );
  }
}
