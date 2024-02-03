import 'package:equatable/equatable.dart';

/// The base class [Failure] indicates incorrect data or operation.
///
/// For example, if the code was executed successfully and the data was incorrect.
class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  String toString() => message;

  @override
  List<Object> get props => <Object>[message];
}
