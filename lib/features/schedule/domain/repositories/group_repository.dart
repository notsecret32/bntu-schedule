import 'package:bntu_schedule/core/error/error.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_number_entity.dart';
import 'package:dartz/dartz.dart';

/// An abstract class for working with groups.
///
/// This class allows you to:
/// * Set the selected group
/// * Remove the selected group
/// * Get the numbers of all available groups
abstract class GroupRepository {
  /// Sets the selected group in the cache.
  ///
  /// If an error occurs, the [CacheFailure] class returns.
  Future<Either<Failure, void>> setGroupNumber(
    String number,
  );

  /// Removes the selected group from the cache.
  ///
  /// If an error occurs, the [CacheFailure] class returns.
  Future<Either<Failure, void>> removeSelectedGroup();

  /// Gets all the group numbers that are in the database.
  ///
  /// Returns [ServerFailure] or [CacheFailure] if an error has occurred.
  Future<Either<Failure, List<GroupNumberEntity>>> getAllGroupsNumber();
}
