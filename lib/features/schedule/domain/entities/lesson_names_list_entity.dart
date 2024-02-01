import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show TLessonNameEntity;
import 'package:equatable/equatable.dart';

/// An alias where the type [TLessonNameEntity] is stored as a List.
typedef TLessonNamesListEntity = List<TLessonNameEntity>;

/// An entity that stores a list of all available lesson names.
class LessonNamesListEntity extends Equatable {
  const LessonNamesListEntity({
    required this.lessonNames,
  });

  /// List of all available lesson names.
  final TLessonNamesListEntity lessonNames;

  /// Creates a new instance of [LessonNamesListEntity] with the same
  /// properties as this instance, but with the provided values.
  LessonNamesListEntity copyWith({
    TLessonNamesListEntity? lessonNames,
  }) {
    return LessonNamesListEntity(
      lessonNames: lessonNames ?? this.lessonNames,
    );
  }

  @override
  List<TLessonNamesListEntity> get props => <TLessonNamesListEntity>[
        lessonNames,
      ];
}
