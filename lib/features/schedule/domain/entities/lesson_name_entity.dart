import 'package:equatable/equatable.dart';

class LessonNameEntity extends Equatable {
  const LessonNameEntity({
    required this.name,
  });

  final String name;

  @override
  List<Object> get props => <Object>[name];
}
