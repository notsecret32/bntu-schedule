import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/schedule/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';

class GetSelectedGroupNumberUseCase extends UseCase<void, NoParams> {
  GetSelectedGroupNumberUseCase({
    required GroupRepository groupRepository,
  }) : _groupRepository = groupRepository;

  final GroupRepository _groupRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      return await _groupRepository.getSelectedGroupNumber();
    } catch (e) {
      return Left<Failure, void>(Failure(e.toString()));
    }
  }
}
