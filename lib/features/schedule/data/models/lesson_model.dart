import 'package:bntu_schedule/core/enums/enums.dart';
import 'package:bntu_schedule/features/schedule/data/models/models.dart'
    show
        LessonNameModel,
        LessonTypeModel,
        LessonTeacherModel,
        LessonTimeModel,
        TranslationModel;
import 'package:bntu_schedule/features/schedule/domain/entities/lesson_entity.dart';

class LessonModel extends LessonEntity {
  const LessonModel({
    required super.weekType,
    required super.time,
    required super.name,
    required super.type,
    required super.teacher,
    required super.classroom,
    super.excludeWeekType,
  });

  factory LessonModel.fromMap(
    Map<String, dynamic>? data,
  ) {
    // ========== [Time] ==========

    const Duration utcOffset = Duration(hours: 3);
    final DateTime defaultDateTime = DateTime(DateTime.now().year);

    late final DateTime start;
    late final DateTime end;

    final Map<String, dynamic>? timeData = data?['time'];

    if (timeData == null) {
      start = defaultDateTime;
      end = defaultDateTime;
    } else {
      start = timeData['start'].toDate().add(utcOffset) ?? defaultDateTime;
      end = timeData['end'].toDate().add(utcOffset) ?? defaultDateTime;
    }

    final LessonTimeModel time = LessonTimeModel(
      start: start,
      end: end,
    );

    // ========== [Name] ==========

    const LessonNameModel defaultRuName = LessonNameModel(
      name: 'Нет названия',
    );

    const LessonNameModel defaultEnName = LessonNameModel(
      name: 'No title',
    );

    final Map<String, dynamic>? nameData = data?['name'];

    late final LessonNameModel ruName;
    late final LessonNameModel enName;

    if (nameData == null) {
      ruName = defaultRuName;
      enName = defaultEnName;
    } else {
      ruName = LessonNameModel(name: nameData['ru']);
      enName = LessonNameModel(name: nameData['en']);
    }

    final TranslationModel<LessonNameModel> name =
        TranslationModel<LessonNameModel>(
      translation: <Languages, LessonNameModel>{
        Languages.ru: ruName,
        Languages.en: enName,
      },
    );

    // ========== [Type] ==========

    const LessonTypeModel defaultRuType = LessonTypeModel(
      name: 'Нет типа',
    );

    const LessonTypeModel defaultEnType = LessonTypeModel(
      name: 'No type',
    );

    final Map<String, dynamic>? typeData = data?['type'];

    late final LessonTypeModel ruType;
    late final LessonTypeModel enType;

    if (typeData == null) {
      ruType = defaultRuType;
      enType = defaultEnType;
    } else {
      ruType = LessonTypeModel(name: typeData['ru']);
      enType = LessonTypeModel(name: typeData['en']);
    }

    final TranslationModel<LessonTypeModel> type =
        TranslationModel<LessonTypeModel>(
      translation: <Languages, LessonTypeModel>{
        Languages.ru: ruType,
        Languages.en: enType,
      },
    );

    // ========== [Type] ==========

    const LessonTeacherModel defaultRuTeacher = LessonTeacherModel(
      firstName: 'Имя',
      secondName: 'Фамилия',
      middleName: 'Отчество',
    );

    const LessonTeacherModel defaultEnTeacher = LessonTeacherModel(
      firstName: 'Name',
      secondName: 'Surname',
      middleName: 'Author',
    );

    final Map<String, dynamic>? teacherData = data?['teacher'];

    late final LessonTeacherModel ruTeacher;
    late final LessonTeacherModel enTeacher;

    if (teacherData == null) {
      ruTeacher = defaultRuTeacher;
      enTeacher = defaultEnTeacher;
    } else {
      ruTeacher = LessonTeacherModel(
        firstName: teacherData['ru']['first_name'],
        secondName: teacherData['ru']['second_name'],
        middleName: teacherData['ru']['middle_name'],
      );
      enTeacher = LessonTeacherModel(
        firstName: teacherData['en']['first_name'],
        secondName: teacherData['en']['second_name'],
        middleName: teacherData['en']['middle_name'],
      );
    }

    final TranslationModel<LessonTeacherModel> teacher =
        TranslationModel<LessonTeacherModel>(
      translation: <Languages, LessonTeacherModel>{
        Languages.ru: ruTeacher,
        Languages.en: enTeacher,
      },
    );

    // ========== [Classroom] ==========
    final String? classroomData = data?['classroom'];

    late final String classroom;

    if (classroomData == null) {
      classroom = '???';
    } else {
      classroom = classroomData;
    }

    // ========== [Week Type] ==========
    final int? weekTypeData = data?['week_type'];

    late final int weekType;

    if (weekTypeData == null) {
      weekType = 0;
    } else {
      weekType = weekTypeData;
    }

    // ========== [Week Type] ==========
    final int? excludeWeekTypeData = data?['exclude_week_type'];

    return LessonModel(
      time: time,
      name: name,
      type: type,
      teacher: teacher,
      classroom: classroom,
      weekType: weekType,
      excludeWeekType: excludeWeekTypeData,
    );
  }
}
