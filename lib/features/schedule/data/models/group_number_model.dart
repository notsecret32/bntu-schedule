import 'package:bntu_schedule/features/schedule/domain/entities/group_number_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// The `data` level model that stores the group number.
class GroupNumberModel extends GroupNumberEntity {
  const GroupNumberModel({required super.number});

  /// Converts data from [Firestore] to an object.
  factory GroupNumberModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data()!;
    return GroupNumberModel(
      number: data['number'],
    );
  }
}
