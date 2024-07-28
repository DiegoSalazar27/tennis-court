import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'passwordtextfield_state.dart';

class PasswordtextfieldCubit extends Cubit<PasswordtextfieldState> {
  PasswordtextfieldCubit() : super(const PasswordtextfieldInitial(true));

  void toggleShowPassword() {
    emit(ChangePasswordTextField(!state.hidePassword));
  }
}
