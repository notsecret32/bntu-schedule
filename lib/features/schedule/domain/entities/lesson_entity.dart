import 'package:bntu_schedule/core/enums/enums.dart' show Languages;
import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show
        TimeEntity,
        TLessonNameEntity,
        TLessonTypeEntity,
        TTeacherEntity,
        TeacherEntity;
import 'package:equatable/equatable.dart';

/// An entity that represents a single lesson.
class LessonEntity extends Equatable {
  const LessonEntity({
    required this.time,
    required this.name,
    required this.type,
    required this.teacher,
    required this.classroom,
  });

  /// An object that stores the beginning and end of the lesson.
  final TimeEntity time;

  /// The name of the lesson in different languages.
  final TLessonNameEntity name;

  /// Type of lesson in different languages.
  ///
  /// Type means the format of the lesson, for example, lecture or practice,
  /// etc.
  final TLessonTypeEntity type;

  /// The teacher who teaches this lesson. Information about the teacher is
  /// also available in different languages.
  final TTeacherEntity teacher;

  /// The place where this lesson is held.
  final String classroom;

  /// Getter, to get the name of the lesson in a specific language.
  String? getName({Languages language = Languages.ru}) {
    return name.translation[language]?.name;
  }

  /// Getter, to get the type of the lesson in a specific language.
  String? getType({Languages language = Languages.ru}) {
    return type.translation[language]?.name;
  }

  /// Getter, to get the teacher of the lesson in a specific language.
  TeacherEntity? getTeacher({Languages language = Languages.ru}) {
    return teacher.translation[language];
  }

  /// Creates a new instance of [LessonEntity] with the same
  /// properties as this instance, but with the provided values.
  LessonEntity copyWith({
    TimeEntity? time,
    TLessonNameEntity? name,
    TLessonTypeEntity? type,
    TTeacherEntity? teacher,
    String? classroom,
  }) {
    return LessonEntity(
      time: time ?? this.time,
      name: name ?? this.name,
      type: type ?? this.type,
      teacher: teacher ?? this.teacher,
      classroom: classroom ?? this.classroom,
    );
  }

  @override
  List<Object> get props => <Object>[
        time,
        name,
        type,
        teacher,
        classroom,
      ];
}
