part of 'admin_authentication_cubit.dart';

sealed class AdminAuthenticationState extends Equatable {
  const AdminAuthenticationState();

  @override
  List<Object> get props => <Object>[];
}

final class AdminAuthenticationInitialState extends AdminAuthenticationState {}

final class AdminAuthenticationLoadingState extends AdminAuthenticationState {}

final class AdminAuthenticationLoadedState extends AdminAuthenticationState {}

final class AdminAuthenticationFailureState extends AdminAuthenticationState {
  const AdminAuthenticationFailureState({
    required this.error,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error];
}
