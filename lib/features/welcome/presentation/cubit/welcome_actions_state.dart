part of 'welcome_actions_cubit.dart';

sealed class WelcomeActionsState extends Equatable {
  const WelcomeActionsState();

  @override
  List<Object> get props => <Object>[];
}

final class WelcomeActionsInitialState extends WelcomeActionsState {}

final class WelcomeActionsLoadingState extends WelcomeActionsState {}

final class WelcomeActionsLoadedState extends WelcomeActionsState {}

final class WelcomeActionsFailureState extends WelcomeActionsState {
  const WelcomeActionsFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error];
}
