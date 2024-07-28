import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/src/features/authentication/presentation/components/password_form_field.dart';

import '../../../bloc/signup_cubit/signup_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.user.password != current.user.password,
      builder: (context, state) {
        return PasswordFormField(
          hintText: "Contraseña",
          onChanged: (newPass) {
            context.read<SignUpCubit>().passwordChanged(newPass);
          },
        );
      },
    );
  }
}
