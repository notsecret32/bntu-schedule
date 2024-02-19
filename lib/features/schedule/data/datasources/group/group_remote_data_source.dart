import 'package:cloud_firestore/cloud_firestore.dart';

/// An abstract class for working with a group at the [Firestore] level.
abstract class GroupRemoteDataSource {
  /// Returns `true` if a group with [groupNumber] exists.
  Future<bool> isGroupExist(String groupNumber);
}

/// Implementation of the abstract class [GroupRemoteDataSource].
class GroupRemoteDataSourceImpl extends GroupRemoteDataSource {
  GroupRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<bool> isGroupExist(String groupNumber) async {
    final DocumentSnapshot<Map<String, dynamic>> groupSnapshot =
        await _firestore.collection('groups').doc(groupNumber).get();

    return groupSnapshot.exists;
  }
}
