part of 'passwordtextfield_cubit.dart';

abstract class PasswordtextfieldState extends Equatable {
  const PasswordtextfieldState(this.hidePassword);
  final bool hidePassword;

  @override
  List<Object> get props => [hidePassword];
}

class PasswordtextfieldInitial extends PasswordtextfieldState {
  const PasswordtextfieldInitial(super.hidePassword);
}

class PasswordtextfieldShow extends PasswordtextfieldState {
  const PasswordtextfieldShow() : super(false);
}

class PasswordtextfieldHide extends PasswordtextfieldState {
  const PasswordtextfieldHide() : super(true);
}

class ChangePasswordTextField extends PasswordtextfieldState {
  const ChangePasswordTextField(super.hidePassword);
}
