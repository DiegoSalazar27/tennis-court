part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  final User user;
  const SignUpState({required this.user});

  @override
  List<Object?> get props => [user];

  SignUpState copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
  }) {
    User newUser = User(
      email: email ?? user.email,
      password: password ?? user.password,
      name: name ?? user.name,
      phone: phone ?? user.phone,
    );
    return SignUpState(user: newUser);
  }
}

class SignUpInitial extends SignUpState {
  const SignUpInitial() : super(user: User.empty);
}

class SignUpError extends SignUpState {
  final String message;
  const SignUpError({
    required super.user,
    required this.message,
  });

  SignUpError.fromState(SignUpState state, this.message)
      : super(
          user: state.user,
        );

  @override
  List<Object?> get props => [user, message];
}

class SignUpLoading extends SignUpState {
  const SignUpLoading({required super.user});

  SignUpLoading.fromState(SignUpState state)
      : super(
          user: state.user,
        );
}

class SignUpSuccess extends SignUpState {
  const SignUpSuccess({required super.user});

  SignUpSuccess.fromState(SignUpState state) : super(user: state.user);
}
