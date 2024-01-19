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

/// An event for navigating to a specific page.
class SelectGroupNavigateToEvent extends SelectGroupEvent {
  const SelectGroupNavigateToEvent({
    required this.router,
    required this.path,
  });

  /// The navigation controller.
  final StackRouter router;

  /// The path to the page.
  final String path;

  @override
  List<Object> get props => <Object>[
        router,
        path,
      ];
}
