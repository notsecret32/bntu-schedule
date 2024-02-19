part of 'group_bloc.dart';

sealed class GroupEvent extends Equatable {
  const GroupEvent();

  @override
  List<Object> get props => <Object>[];
}

final class SelectGroupEvent extends GroupEvent {
  const SelectGroupEvent({
    required this.groupNumber,
  });

  final String groupNumber;

  @override
  List<String> get props => <String>[groupNumber];
}

final class GetSelectedGroupNumberEvent extends GroupEvent {}

final class RemoveSelectedGroupNumberEvent extends GroupEvent {}
