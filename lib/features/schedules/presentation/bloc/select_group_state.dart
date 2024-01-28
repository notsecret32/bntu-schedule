part of 'select_group_bloc.dart';

/// The base state class for [SelectGroupBloc].
sealed class SelectGroupState extends Equatable {
  const SelectGroupState();

  @override
  List<Object> get props => <Object>[];
}

/// Initial state, loaded by default.
final class SelectGroupInitialState extends SelectGroupState {}

/// A state where some kind of asynchronous operation is taking place.
///
/// For example, getting all available groups.
final class SelectGroupLoadingState extends SelectGroupState {}

/// The state when the data is received.
final class SelectGroupLoadedState extends SelectGroupState {
  const SelectGroupLoadedState({
    required this.groups,
  });

  /// A list of available groups.
  final List<GroupNumberEntity> groups;
}

/// The state when the group number is removed.
final class SelectGroupNumberRemoved extends SelectGroupState {}

/// The state when the group number is selected.
final class SelectGroupNumberSelected extends SelectGroupState {}

/// The state when the error occurred.
final class SelectGroupFailureState extends SelectGroupState {
  const SelectGroupFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error];
}
