import 'package:equatable/equatable.dart';

/// The entity that represents the type of lesson.
///
/// The type of lesson means the format of the lesson,
/// for example, lecture, practice, consultation and etc.
class LessonTypeEntity extends Equatable {
  const LessonTypeEntity({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => <Object>[name];
}
