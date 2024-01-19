import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/core/usecases/usecase.dart';
import 'package:bntu_schedule/src/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

/// Removes the selected group from the cache.
class RemoveSelectedGroupUseCase extends UseCase<void, NoParams> {
  RemoveSelectedGroupUseCase({required GroupRepository groupRepository})
      : _groupRepository = groupRepository;

  /// Instance of the [GroupRepository] class for working with groups.
  final GroupRepository _groupRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _groupRepository.removeSelectedGroup();
  }
}
