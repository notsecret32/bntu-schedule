import 'package:equatable/equatable.dart';

/// The entity that represents the start and end time of the lesson.
class LessonTimeEntity extends Equatable {
  const LessonTimeEntity({
    required this.start,
    required this.end,
  });

  final DateTime start;
  final DateTime end;

  @override
  List<Object> get props => <Object>[start, end];
}
