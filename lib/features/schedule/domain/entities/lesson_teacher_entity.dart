import 'package:equatable/equatable.dart';

class LessonTeacherEntity extends Equatable {
  const LessonTeacherEntity({
    required this.firstName,
    required this.secondName,
    required this.middleName,
  });

  final String firstName;
  final String secondName;
  final String middleName;

  /// Returns the full name of this teacher.
  ///
  /// ```dart
  /// final teacher = TeacherEntity(
  ///   firstName: 'Ivan',
  ///   secondName: 'Turgenev',
  ///   middleName: 'Sergeyevich',
  /// );
  ///
  /// print(teacher.getFullName())  // Turgenev I. S.
  /// ```
  String getFullName() {
    final String firstLetterOfFirstName = firstName.substring(0, 1);
    final String firstLetterOfMiddleName = middleName.substring(0, 1);
    return '$secondName $firstLetterOfFirstName. $firstLetterOfMiddleName.';
  }

  @override
  List<Object> get props => <Object>[
        firstName,
        secondName,
        middleName,
      ];
}
