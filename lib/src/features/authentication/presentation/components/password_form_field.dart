import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/passwordTextFieldCubit/passwordtextfield_cubit.dart';
import 'icon_vertical_line.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    this.onChanged,
    this.hintText = "Contraseña",
    this.textInputAction = TextInputAction.next,
  });

  final void Function(String)? onChanged;
  final String hintText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordtextfieldCubit>(
      create: (context) => PasswordtextfieldCubit(),
      child: BlocBuilder<PasswordtextfieldCubit, PasswordtextfieldState>(
        builder: (context, state) {
          final passwordCubit =
              BlocProvider.of<PasswordtextfieldCubit>(context);
          return TextFormField(
            onChanged: onChanged,
            obscureText: state.hidePassword,
            decoration: InputDecoration(
              labelText: hintText,
              prefixIcon: const IconWithVerticalLine(
                icon: Icons.lock_outline,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  state.hidePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                tooltip: 'Show password',
                onPressed: () {
                  passwordCubit.toggleShowPassword();
                },
              ),
            ),
            textInputAction: textInputAction,
          );
        },
      ),
    );
  }
}
