import 'package:bntu_schedule/core/error/error.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/schedules/domain/entities/group_number_entity.dart';
import 'package:bntu_schedule/features/schedules/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

/// Gets a list of all available groups.
class GetAllGroupsNumberUseCase
    extends UseCase<List<GroupNumberEntity>, NoParams> {
  GetAllGroupsNumberUseCase({
    required GroupRepository groupRepository,
  }) : _groupRepository = groupRepository;

  /// Instance of the [GroupRepository] class for working with groups.
  final GroupRepository _groupRepository;

  @override
  Future<Either<Failure, List<GroupNumberEntity>>> call(
    NoParams params,
  ) async {
    return await _groupRepository.getAllGroupsNumber();
  }
}
