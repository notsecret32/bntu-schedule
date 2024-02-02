import 'package:equatable/equatable.dart';

/// The entity that represents the group number. Used to check for the
/// existence of such a group number in [Firestore].
class GroupNumberEntity extends Equatable {
  const GroupNumberEntity({
    required this.groupNumber,
  });

  /// Group number.
  final String groupNumber;

  @override
  List<String> get props => <String>[groupNumber];
}
