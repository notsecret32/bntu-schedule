import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:dartz/dartz.dart';

/// An abstract repository class for working with a schedule.
abstract class ScheduleRepository {
  /// Returns the schedule as a [GroupScheduleEntity] object.
  Future<Either<Failure, GroupScheduleEntity>> getScheduleByGroupNumber(
    String groupNumber,
  );
}
