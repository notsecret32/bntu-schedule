part of 'settings_bloc.dart';

/// The base class of the event for [SettingsBloc].
sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => <Object>[];
}

/// Event for removing the selected group.
class SettingsRemoveSelectedGroupEvent extends SettingsEvent {}
