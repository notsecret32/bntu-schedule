import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:bntu_schedule/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:dartz/dartz.dart';

class GetScheduleByGroupNumberUseCase
    extends UseCase<GroupScheduleEntity, String> {
  GetScheduleByGroupNumberUseCase({
    required ScheduleRepository scheduleRepository,
  }) : _scheduleRepository = scheduleRepository;

  final ScheduleRepository _scheduleRepository;

  @override
  Future<Either<Failure, GroupScheduleEntity>> call(
    String params,
  ) async {
    try {
      final Either<Failure, GroupScheduleEntity> schedule =
          await _scheduleRepository.getScheduleByGroupNumber(params);
      return schedule;
    } catch (e) {
      return Left<Failure, GroupScheduleEntity>(Failure(e.toString()));
    }
  }
}
