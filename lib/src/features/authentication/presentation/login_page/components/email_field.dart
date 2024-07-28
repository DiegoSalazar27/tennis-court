import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_cubit/login_cubit.dart';
import '../../components/icon_vertical_line.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: "Email",
            hintText: "usuario@email.com",
            prefixIcon: IconWithVerticalLine(icon: Icons.email_outlined),
          ),
          onChanged: (newValue) {
            context.read<LoginCubit>().emailChanged(email: newValue);
          },
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }
}
