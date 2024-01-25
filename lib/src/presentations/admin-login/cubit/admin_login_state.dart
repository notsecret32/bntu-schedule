part of 'admin_login_cubit.dart';

sealed class AdminLoginState extends Equatable {
  const AdminLoginState();

  @override
  List<Object> get props => <Object>[];
}

final class AdminLoginInitialState extends AdminLoginState {}

final class AdminLoginLoadingState extends AdminLoginState {}

final class AdminLoginLoadedState extends AdminLoginState {}

final class AdminLoginFailureState extends AdminLoginState {
  const AdminLoginFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error];
}
