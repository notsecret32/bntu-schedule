part of 'settings_bloc.dart';

/// The base state class for [SettingsState].
sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => <Object>[];
}

/// The initial state of the page when it first loaded.
final class SettingsInitialState extends SettingsState {}

/// The state of the page when it started executing some event.
final class SettingsLoadingState extends SettingsState {}

/// The state of the page when the execution of the event is successfully
/// completed.
final class SettingsLoadedState extends SettingsState {}

/// The state of the page when some kind of error occurred.
final class SettingsFailureState extends SettingsState {
  const SettingsFailureState({required this.error});

  /// Error text.
  final String error;

  @override
  List<Object> get props => <Object>[error];
}
