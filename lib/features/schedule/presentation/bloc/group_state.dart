part of 'group_bloc.dart';

sealed class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object> get props => <Object>[];
}

final class GroupInitialState extends GroupState {}

final class GroupLoadingState extends GroupState {}

final class GroupLoadedState extends GroupState {}

final class GroupFailureState extends GroupState {
  const GroupFailureState({required this.message});

  final String message;

  @override
  List<String> get props => <String>[message];
}
