import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show TranslationEntity;
import 'package:equatable/equatable.dart';

typedef TTeacherEntity = TranslationEntity<TeacherEntity>;

/// An entity that stores information about the teacher.
class TeacherEntity extends Equatable {
  const TeacherEntity({
    required this.firstName,
    required this.secondName,
    required this.middleName,
  });

  /// First name of the teacher.
  final String firstName;

  /// Last name of the teacher.
  final String secondName;

  /// Middle name of the teacher.
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
    final String firstLetterOfSecondName = secondName.substring(0, 1);
    return '$middleName $firstLetterOfFirstName. $firstLetterOfSecondName.';
  }

  /// Creates a new instance of [TeacherEntity] with the same
  /// properties as this instance, but with the provided values.
  TeacherEntity copyWith({
    String? firstName,
    String? secondName,
    String? middleName,
  }) {
    return TeacherEntity(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      middleName: middleName ?? this.middleName,
    );
  }

  @override
  List<String> get props => <String>[
        firstName,
        secondName,
        middleName,
      ];
}
