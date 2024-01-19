import 'package:equatable/equatable.dart';

/// The `domain` level entity, stores the group number.
class GroupNumberEntity extends Equatable {
  const GroupNumberEntity({required this.number});

  /// Unique group number.
  final String number;

  @override
  List<Object?> get props => <Object?>[number];
}
