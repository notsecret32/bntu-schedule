import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show TranslationEntity;
import 'package:equatable/equatable.dart';

/// An alias where [LessonNameEntity] is stored in different languages.
typedef TLessonNameEntity = TranslationEntity<LessonNameEntity>;

/// The entity that represents the name of the lesson.
class LessonNameEntity extends Equatable {
  const LessonNameEntity({
    required this.name,
  });

  /// Lesson name.
  final String name;

  /// Creates a new instance of [LessonNameEntity] with the same
  /// properties as this instance, but with the provided values.
  LessonNameEntity copyWith({
    String? name,
  }) {
    return LessonNameEntity(
      name: name ?? this.name,
    );
  }

  @override
  List<String> get props => <String>[
        name,
      ];
}
