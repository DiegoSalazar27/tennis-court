import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/src/features/authentication/bloc/signup_cubit/signup_cubit.dart';
import '../../components/icon_vertical_line.dart';

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.user.name != current.user.name,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: "Nombre y apellido",
            hintText: "",
            prefixIcon: IconWithVerticalLine(icon: Icons.person_outline),
          ),
          onChanged: (newValue) {
            context.read<SignUpCubit>().nameChanged(newValue);
          },
          keyboardType: TextInputType.name,
        );
      },
    );
  }
}
