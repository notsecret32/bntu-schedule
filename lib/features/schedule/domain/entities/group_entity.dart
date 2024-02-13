import 'package:equatable/equatable.dart';

/// An entity representing a group stores information about it.
class GroupEntity extends Equatable {
  const GroupEntity({
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  List<String> get props => <String>[groupNumber];
}
