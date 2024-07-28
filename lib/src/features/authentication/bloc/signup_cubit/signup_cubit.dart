import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/regex.dart';
import '../../models/user.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpInitial());

  emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  phoneChanged(String name) {
    emit(state.copyWith(phone: name));
  }

  bool validateInputData() {
    if (state.user.email.isEmpty) {
      emit(
        SignUpError.fromState(
          state,
          'Correo requerido',
        ),
      );
      return false;
    } else if (!emailValidator(state.user.email.trim())) {
      emit(SignUpError.fromState(
        state,
        'Correo inválido',
      ));
      return false;
    }

    if (state.user.password.isEmpty) {
      emit(SignUpError.fromState(
        state,
        'Contraseña requerida',
      ));
      return false;
    } else if (state.user.password.length < 6) {
      emit(SignUpError.fromState(
        state,
        'La contraseña debe contener al menos 6 caracteres',
      ));
      return false;
    }

    return true;
  }

  Future<void> signUpAttempt() async {
    try {
      emit(SignUpLoading.fromState(state));

      if (!validateInputData()) {
        emit(SignUpError.fromState(state, 'Invalid fields'));
      }

      emit(SignUpSuccess.fromState(state));
    } catch (e) {
      emit(SignUpError.fromState(state, e.toString()));
    }
  }
}
