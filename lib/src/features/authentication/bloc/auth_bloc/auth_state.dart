part of 'auth_bloc.dart';

enum AuthenticatedStatus { authenticated, unauthenticated, unknown }

class AuthState extends Equatable {
  const AuthState({
    required this.currentUser,
    required this.authenticatedStatus,
    required this.users,
  });
  final AuthenticatedStatus authenticatedStatus;
  final User currentUser;
  final List<User> users;

  const AuthState.initial()
      : currentUser = User.empty,
        authenticatedStatus = AuthenticatedStatus.unknown,
        users = const [];

  AuthState.loading(AuthState? state)
      : currentUser = state?.currentUser ?? User.empty,
        authenticatedStatus =
            state?.authenticatedStatus ?? AuthenticatedStatus.unknown,
        users = state?.users ?? const [];

  AuthState.authenticated(this.currentUser,
      {required AuthState state, List<User>? users})
      : authenticatedStatus = AuthenticatedStatus.authenticated,
        users = users ?? state.users;

  AuthState.unauthenticated({required AuthState state})
      : currentUser = User.empty,
        authenticatedStatus = AuthenticatedStatus.unauthenticated,
        users = state.users;

  @override
  List<Object> get props => [currentUser, authenticatedStatus, users];
}
