import 'package:bntu_schedule/features/schedule/domain/entities/entities.dart'
    show TTeacherEntity;
import 'package:equatable/equatable.dart';

/// An alias, for [List] type [TTeacherEntity].
typedef TTeachersListEntity = List<TTeacherEntity>;

/// An entity that stores a list of all available teachers.
class TeachersListEntity extends Equatable {
  const TeachersListEntity({required this.teachers});

  /// List of all available teachers.
  final TTeachersListEntity teachers;

  /// Creates a new instance of [TeachersListEntity] with the same
  /// properties as this instance, but with the provided values.
  TeachersListEntity copyWith({
    TTeachersListEntity? teachers,
  }) {
    return TeachersListEntity(
      teachers: teachers ?? this.teachers,
    );
  }

  @override
  List<TTeachersListEntity> get props => <TTeachersListEntity>[teachers];
}
