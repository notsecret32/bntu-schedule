import 'package:bntu_schedule/src/data/models/group_number_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// An abstract class for working with remote data.
abstract class GroupRemoteDataSource {
  /// Gets a list of all available groups number.
  Future<List<GroupNumberModel>> getAllGroupsNumber();
}

/// Implementations of the abstract class [GroupRemoteDataSource].
class GroupRemoteDataSourceImpl extends GroupRemoteDataSource {
  GroupRemoteDataSourceImpl({required this.firestore});

  /// An instance of the [FirebaseFirestore] class for working with [Firestore].
  final FirebaseFirestore firestore;

  @override
  Future<List<GroupNumberModel>> getAllGroupsNumber() async {
    // Getting a list of all available groups from the collection.
    final QuerySnapshot<Map<String, dynamic>> groupsRef =
        await firestore.collection('groups').get();

    // Converting the received data into a List<GroupNumberModel>.
    final List<GroupNumberModel> groups = groupsRef.docs
        .map(
          GroupNumberModel.fromFirestore,
        )
        .toList();

    // We return the received list of available groups number.
    return groups;
  }
}
