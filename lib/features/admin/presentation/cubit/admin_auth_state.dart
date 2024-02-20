part of 'admin_auth_cubit.dart';

sealed class AdminAuthState extends Equatable {
  const AdminAuthState();

  @override
  List<Object> get props => <Object>[];
}

final class AdminAuthInitialState extends AdminAuthState {}

final class AdminAuthLoggingInState extends AdminAuthState {}

final class AdminAuthLoggingOutState extends AdminAuthState {}

final class AdminAuthLoggedInState extends AdminAuthState {}

final class AdminAuthLoggedOutState extends AdminAuthState {}

final class AdminAuthFailureState extends AdminAuthState {
  const AdminAuthFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error];
}
