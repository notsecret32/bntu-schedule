import 'package:bntu_schedule/core/enums/languages_enum.dart';
import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show
        LessonNameEntity,
        LessonTypeEntity,
        LessonTeacherEntity,
        LessonTimeEntity,
        TranslationEntity;
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

/// The entity that represents the lesson.
class LessonEntity extends Equatable {
  const LessonEntity({
    required this.name,
    required this.type,
    required this.teacher,
    required this.time,
    required this.classroom,
    required this.weekType,
    this.excludeWeekType,
  });

  /// The name of the lesson in different languages.
  final TranslationEntity<LessonNameEntity> name;

  /// The type of lesson in different languages.
  final TranslationEntity<LessonTypeEntity> type;

  /// The teacher who teaches this lesson.
  final TranslationEntity<LessonTeacherEntity> teacher;

  /// The time of the lesson.
  final LessonTimeEntity time;

  /// The location of the lesson.
  final String classroom;

  /// The type of week in which this lesson is held.
  ///
  /// Indicates which subgroup goes to this lesson in which week.
  /// This is calculated by comparing the week type of the selected day
  /// and the week type specified for this activity.
  ///
  /// There are types of weeks:
  /// * 0 - It means that this lesson is available every week.
  /// * 1 - This means that the first subgroup in the first week goes to
  /// this lesson.
  /// * 2 - This means that the second subgroup in the first week goes to
  /// this lesson.
  ///
  /// If it is the second week, then the subgroups are swapped.
  final int weekType;

  /// Indicates which week this lesson will be excluded.
  ///
  /// This means that this lesson will not be shown in the schedule
  /// for the specified type of week.
  final int? excludeWeekType;

  /// Returns the name of the lesson in a specific language.
  String getName({Languages language = Languages.ru}) {
    return name.translation[language]?.name ?? 'Нет данных';
  }

  /// Returns the type of the lesson in a specific language.
  String getType({Languages language = Languages.ru}) {
    return type.translation[language]?.name ?? 'Нет данных';
  }

  /// Returns the teacher of the lesson in a specific language.
  LessonTeacherEntity getTeacher({Languages language = Languages.ru}) {
    if (teacher.translation[language] != null) {
      return teacher.translation[language]!;
    }

    return language == Languages.ru
        ? const LessonTeacherEntity(
            firstName: 'Имя',
            secondName: 'Фамилия',
            middleName: 'Отчество',
          )
        : const LessonTeacherEntity(
            firstName: 'Name',
            secondName: 'Surname',
            middleName: 'Author',
          );
  }

  /// Formats the time in a specific format.
  String timeToString() {
    final String startFormatted = DateFormat('HH:mm').format(time.start);
    final String endFormatted = DateFormat('HH:mm').format(time.end);
    return '$startFormatted-$endFormatted';
  }

  @override
  List<Object> get props => <Object>[
        name,
        type,
        teacher,
        time,
        classroom,
        weekType,
      ];
}
