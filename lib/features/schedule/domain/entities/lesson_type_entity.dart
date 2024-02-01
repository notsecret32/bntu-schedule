import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show TranslationEntity;
import 'package:equatable/equatable.dart';

/// An alias for [LessonTypeEntity], which is stored in different languages.
typedef TLessonTypeEntity = TranslationEntity<LessonTypeEntity>;

/// The entity that represents the name of the lesson type.
///
/// For example: lecture, practice, course design, diploma design, etc.
class LessonTypeEntity extends Equatable {
  const LessonTypeEntity({
    required this.name,
  });

  /// The name of the lesson type.
  final String name;

  /// Creates a new instance of [LessonTypeEntity] with the same
  /// properties as this instance, but with the provided values.
  LessonTypeEntity copyWith({
    String? name,
  }) {
    return LessonTypeEntity(
      name: name ?? this.name,
    );
  }

  @override
  List<String> get props => <String>[name];
}
