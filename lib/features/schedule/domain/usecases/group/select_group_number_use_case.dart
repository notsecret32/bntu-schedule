import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/core/usecases/usecase.dart';
import 'package:bntu_schedule/features/schedule/domain/repositories/group_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SelectGroupNumberUseCase extends UseCase<void, SelectGroupNumberParams> {
  SelectGroupNumberUseCase({
    required GroupRepository groupRepository,
  }) : _groupRepository = groupRepository;

  final GroupRepository _groupRepository;

  @override
  Future<Either<Failure, void>> call(
    SelectGroupNumberParams params,
  ) async {
    try {
      return await _groupRepository.selectGroupNumber(params.groupNumber);
    } catch (e) {
      return Left<Failure, void>(Failure(e.toString()));
    }
  }
}

class SelectGroupNumberParams extends Equatable {
  const SelectGroupNumberParams({
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  List<String> get props => <String>[groupNumber];
}
