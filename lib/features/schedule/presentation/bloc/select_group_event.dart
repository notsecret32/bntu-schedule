part of 'select_group_bloc.dart';

/// Default event class for [SelectGroupBloc].
sealed class SelectGroupEvent extends Equatable {
  const SelectGroupEvent();

  @override
  List<Object> get props => <Object>[];
}

/// An event for uploading all available groups.
class SelectGroupLoadEvent extends SelectGroupEvent {}

/// An event for selecting a group.
class SelectGroupNumberEvent extends SelectGroupEvent {
  const SelectGroupNumberEvent({
    required this.number,
  });

  // Group number.
  final String number;

  @override
  List<Object> get props => <Object>[number];
}
