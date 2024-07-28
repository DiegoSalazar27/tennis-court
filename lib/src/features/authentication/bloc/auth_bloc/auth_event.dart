part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  final User user;
  const AuthUserChanged(this.user);
}

class AuthUserAddFavorites extends AuthEvent {
  const AuthUserAddFavorites(this.fieldId);
  final int fieldId;
}

class AuthUserRemoveFavorites extends AuthEvent {
  final int fieldId;
  const AuthUserRemoveFavorites(this.fieldId);
}

class AuthLogoutRequested extends AuthEvent {}

class AuthUserSignUp extends AuthEvent {
  final User user;
  const AuthUserSignUp(this.user);
}

class AuthUserLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthUserLogin({required this.email, required this.password});
}
