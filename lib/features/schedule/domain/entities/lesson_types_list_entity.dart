import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show TLessonTypeEntity;
import 'package:equatable/equatable.dart';

/// An alias for a [List] of type [TLessonTypeEntity].
typedef TLessonTypesEntityList = List<TLessonTypeEntity>;

/// An entity that stores all available lesson types.
class LessonTypesListEntity extends Equatable {
  const LessonTypesListEntity({
    required this.lessonTypes,
  });

  /// List of all available lesson types.
  final TLessonTypesEntityList lessonTypes;

  /// Creates a new instance of [LessonTypesListEntity] with the same
  /// properties as this instance, but with the provided values.
  LessonTypesListEntity copyWith({
    TLessonTypesEntityList? lessonTypes,
  }) {
    return LessonTypesListEntity(
      lessonTypes: lessonTypes ?? this.lessonTypes,
    );
  }

  @override
  List<TLessonTypesEntityList> get props => <TLessonTypesEntityList>[
        lessonTypes,
      ];
}
