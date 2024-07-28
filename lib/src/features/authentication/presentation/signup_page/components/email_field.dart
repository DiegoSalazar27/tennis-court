import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/signup_cubit/signup_cubit.dart';
import '../../components/icon_vertical_line.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.user.email != current.user.email,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "usuario@email.com",
            prefixIcon: IconWithVerticalLine(icon: Icons.email_outlined),
          ),
          onChanged: (newValue) {
            context.read<SignUpCubit>().emailChanged(newValue);
          },
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}
