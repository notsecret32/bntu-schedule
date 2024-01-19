import 'package:equatable/equatable.dart';

/// The standard parameter for [UseCase] indicates indicates that there are
/// no parameters.
final class NoParams extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}
