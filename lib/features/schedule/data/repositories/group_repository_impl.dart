import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/core/network/network_info.dart';
import 'package:bntu_schedule/features/schedule/data/datasources/group/group.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_entity.dart';
import 'package:bntu_schedule/features/schedule/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

/// Implementation of the abstract GroupRepository class.
class GroupRepositoryImpl extends GroupRepository {
  GroupRepositoryImpl({
    required GroupRemoteDataSource remoteDataSource,
    required GroupLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  final GroupRemoteDataSource _remoteDataSource;
  final GroupLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, void>> selectGroupNumber(
    String groupNumber,
  ) async {
    try {
      // Checking the network connection
      if (!await _networkInfo.isConnected) {
        throw const Failure(
          'Нет подключения к сети Интернет',
        );
      }

      // Checking if there is a group with this number
      if (!await _remoteDataSource.isGroupExist(groupNumber)) {
        throw const Failure('Такой группы не существует');
      }

      // If there is such a group, save it in the cache
      _localDataSource.saveSelectedGroupNumber(groupNumber);

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GroupEntity>> getSelectedGroupNumber() async {
    try {
      final String? selectedGroupNumber =
          await _localDataSource.getSelectedGroupNumber();

      if (selectedGroupNumber == null) {
        throw const Failure('Такой группы нет');
      }

      return Right<Failure, GroupEntity>(
        GroupEntity(
          groupNumber: selectedGroupNumber,
        ),
      );
    } catch (e) {
      return Left<Failure, GroupEntity>(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeSelectedGroupNumber() async {
    try {
      await _localDataSource.removeSelectedGroupNumber();
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(Failure(e.toString()));
    }
  }
}
