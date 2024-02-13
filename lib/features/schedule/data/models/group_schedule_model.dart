import 'package:bntu_schedule/features/schedule/data/models/lesson_model.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/group_schedule_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupScheduleModel extends GroupScheduleEntity {
  const GroupScheduleModel({
    required super.monday,
    required super.tuesday,
    required super.wednesday,
    required super.thursday,
    required super.friday,
    required super.saturday,
    required super.sunday,
  });

  factory GroupScheduleModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    // Receive a document with a schedule
    final Map<String, dynamic>? data = document.data();

    // Converting each field into an array with a schedule
    final List<LessonModel>? monday =
        GroupScheduleModel.fromList(data?['monday']);
    final List<LessonModel>? tuesday =
        GroupScheduleModel.fromList(data?['tuesday']);
    final List<LessonModel>? wednesday =
        GroupScheduleModel.fromList(data?['wednesday']);
    final List<LessonModel>? thursday =
        GroupScheduleModel.fromList(data?['thursday']);
    final List<LessonModel>? friday =
        GroupScheduleModel.fromList(data?['friday']);
    final List<LessonModel>? saturday =
        GroupScheduleModel.fromList(data?['saturday']);
    final List<LessonModel>? sunday =
        GroupScheduleModel.fromList(data?['sunday']);

    // Return the schedule in the form of an object
    return GroupScheduleModel(
      monday: monday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
    );
  }

  /// Converts a [List] of the dynamic to a [List] of the LessonModel.
  static List<LessonModel>? fromList(List<dynamic>? data) {
    if (data == null) {
      return null;
    }

    return data
        .map(
          (dynamic data) => LessonModel.fromMap(data as Map<String, dynamic>),
        )
        .toList()
        .cast<LessonModel>();
  }
}
