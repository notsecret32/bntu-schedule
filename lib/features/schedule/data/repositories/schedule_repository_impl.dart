import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/features/schedule/data/models/group_schedule_model.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:bntu_schedule/features/schedule/schedule.dart';
import 'package:dartz/dartz.dart';

/// Implementation of the abstract ScheduleRepository class.
class ScheduleRepositoryImpl extends ScheduleRepository {
  ScheduleRepositoryImpl({
    required ScheduleRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final ScheduleRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, GroupScheduleEntity>> getScheduleByGroupNumber(
    String groupNumber,
  ) async {
    try {
      final GroupScheduleModel schedule =
          await _remoteDataSource.getScheduleByGroupNumber(groupNumber);

      return Right<Failure, GroupScheduleEntity>(schedule);
    } catch (e) {
      return Left<Failure, GroupScheduleEntity>(Failure(e.toString()));
    }
  }
}
