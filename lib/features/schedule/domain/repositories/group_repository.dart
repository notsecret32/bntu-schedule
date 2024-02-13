import 'package:bntu_schedule/core/error/failure.dart' show Failure;
import 'package:bntu_schedule/features/schedule/domain/entities/group_entity.dart';
import 'package:dartz/dartz.dart';

/// An abstract repository class for working with a group.
abstract class GroupRepository {
  /// Saves the selected group by saving [groupNumber] in the cache.
  ///
  /// Throws a [Failure] exception if something went wrong.
  Future<Either<Failure, void>> selectGroupNumber(
    String groupNumber,
  );

  /// Returns [GroupEntity] from the cache.
  ///
  /// Throws a [Failure] exception if something went wrong.
  Future<Either<Failure, GroupEntity>> getSelectedGroupNumber();

  /// Removes the selected group from the cache.
  ///
  /// Throws a [Failure] exception if something went wrong.
  Future<Either<Failure, void>> removeSelectedGroupNumber();
}
