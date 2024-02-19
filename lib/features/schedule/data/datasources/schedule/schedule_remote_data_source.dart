import 'package:bntu_schedule/core/error/failure.dart';
import 'package:bntu_schedule/features/schedule/data/models/group_schedule_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// An abstract class for working with a schedule.
abstract class ScheduleRemoteDataSource {
  /// Returns a schedule for a specific group with the number [groupNumber].
  Future<GroupScheduleModel> getScheduleByGroupNumber(String groupNumber);
}

/// Implementation of the abstract class [ScheduleRemoteDataSource].
class ScheduleRemoteDataSourceImpl extends ScheduleRemoteDataSource {
  ScheduleRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  @override
  Future<GroupScheduleModel> getScheduleByGroupNumber(
    String groupNumber,
  ) async {
    // Receive a document with a schedule
    final DocumentSnapshot<Map<String, dynamic>> schedule =
        await _firestore.collection('schedules').doc(groupNumber).get();

    // If there is no such document, we return an error
    if (!schedule.exists) {
      throw const Failure('Такого расписания нет!');
    }

    // Otherwise, we return the schedule as an object
    return GroupScheduleModel.fromFirestore(schedule);
  }
}
