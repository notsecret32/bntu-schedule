part of 'admin_home_login_cubit.dart';

sealed class AdminHomeLoginState extends Equatable {
  const AdminHomeLoginState();

  @override
  List<Object> get props => <Object>[];
}

final class AdminHomeLoginInitialState extends AdminHomeLoginState {}

final class AdminHomeLoginLoadingState extends AdminHomeLoginState {}

final class AdminHomeLoginLoadedState extends AdminHomeLoginState {}

final class AdminHomeLoginFailureState extends AdminHomeLoginState {
  const AdminHomeLoginFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error];
}
