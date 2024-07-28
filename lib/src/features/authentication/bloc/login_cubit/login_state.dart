part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String email;
  final String password;
  const LoginState({required this.email, required this.password});

  @override
  List<String?> get props => [email, password];

  LoginState copyWith({String? email, String? password}) {
    LoginState newState = LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
    return newState;
  }
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(email: "", password: "");

  @override
  LoginState copyWith({String? email, String? password}) {
    LoginState newState = LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
    return newState;
  }
}

class LoginError extends LoginState {
  final String message;
  const LoginError({
    required super.email,
    required super.password,
    required this.message,
  });

  LoginError.fromState(LoginState state, this.message)
      : super(
          email: state.email,
          password: state.password,
        );
}

class LoginLoading extends LoginState {
  const LoginLoading({required super.email, required super.password});

  LoginLoading.fromState(LoginState state)
      : super(
          email: state.email,
          password: state.password,
        );
}

class LoginSuccess extends LoginState {
  const LoginSuccess({required super.email, required super.password});

  LoginSuccess.fromState(LoginState state)
      : super(
          email: state.email,
          password: state.password,
        );
}
