import 'package:bntu_schedule/core/enums/enums.dart' show Languages;
import 'package:equatable/equatable.dart';

/// An alias, to shorten the record. It is of type [Map],
/// with a key of type [String] and with a value of type [T].
typedef Translation<T> = Map<Languages, T>;

/// An entity that is generic, for storing [T] in different languages.
///
/// If `typedef` is used to improve readability, then they start with
/// the letter `T'.
///
/// ```dart
/// // This `typedef` starts with a `T'.
/// typedef TEntity = Translation<Entity>;
///
/// // A simple class for an example
/// class Entity {
///   const Entity({
///     required this.name
///   });
///
///   final String name;
/// }
/// ```
class TranslationEntity<T> extends Equatable {
  const TranslationEntity({
    required this.translation,
  });

  /// An object that stores T in different languages.
  ///
  /// ```dart
  /// // A simple class for an example
  /// class Entity {
  ///   const Entity({
  ///     required this.name
  ///   });
  ///
  ///   final String name;
  /// }
  ///
  /// // Creating our entity
  /// final entity = Translation<Entity>(
  ///   translation: {
  ///     Languages.ru: Entity(
  ///       name: 'Сущность',
  ///     ),
  ///     Languages.en: Entity(
  ///       name: 'Entity',
  ///     ),
  ///   },
  /// );
  ///
  /// // Output the entity name in different languages
  /// print(entity.translation[Languages.ru]!.name)   // Сущность
  /// print(entity.translation[Languages.en]!.name)   // Entity
  /// ```
  final Translation<T> translation;

  /// Creates a new instance of [TranslationEntity] with the same
  /// properties as this instance, but with the provided values.
  TranslationEntity<T> copyWith({
    Translation<T>? translation,
  }) {
    return TranslationEntity<T>(
      translation: translation ?? this.translation,
    );
  }

  @override
  List<Translation<T>> get props => <Translation<T>>[translation];
}
