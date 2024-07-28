import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/regex.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  emailChanged({required String email}) {
    emit(state.copyWith(email: email));
  }

  passwordChanged({required String password}) {
    emit(state.copyWith(password: password));
  }

  bool validateInputData() {
    if (state.email.isEmpty) {
      emit(
        LoginError.fromState(
          state,
          'Correo requerido',
        ),
      );
      return false;
    } else if (!emailValidator(state.email.trim())) {
      emit(LoginError.fromState(
        state,
        'Correo inválido',
      ));
      return false;
    }

    if (state.password.isEmpty) {
      emit(LoginError.fromState(
        state,
        'Contraseña requerida',
      ));
      return false;
    } else if (state.password.length < 6) {
      emit(LoginError.fromState(
        state,
        'La contraseña debe contener al menos 6 caracteres',
      ));
      return false;
    }

    return true;
  }

  Future<void> loginAttempt() async {
    try {
      emit(LoginLoading.fromState(state));

      if (!validateInputData()) {
        emit(LoginError.fromState(state, 'Invalid fields'));
      }

      emit(LoginSuccess.fromState(state));
    } catch (e) {
      print('Error at loginAttempt $e');
      emit(LoginError.fromState(state, e.toString()));
    }
  }
}
