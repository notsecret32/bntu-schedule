import 'package:bntu_schedule/src/core/error/failure/failure.dart';
import 'package:bntu_schedule/src/core/usecases/usecase.dart';
import 'package:bntu_schedule/src/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// Sets the selected group in the cache.
class SetGroupNumberUseCase extends UseCase<void, SetGroupNumberParams> {
  SetGroupNumberUseCase({
    required GroupRepository groupRepository,
  }) : _groupRepository = groupRepository;

  /// Instance of the [GroupRepository] class for working with groups.
  final GroupRepository _groupRepository;

  @override
  Future<Either<Failure, void>> call(
    SetGroupNumberParams params,
  ) async {
    return await _groupRepository.setGroupNumber(params.number);
  }
}

/// The parameter class for [SetGroupNumberUseCase].
class SetGroupNumberParams extends Equatable {
  const SetGroupNumberParams({required this.number});

  /// The group number.
  final String number;

  @override
  List<Object> get props => <Object>[number];
}
