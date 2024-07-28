import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/src/features/authentication/bloc/signup_cubit/signup_cubit.dart';

import '../../components/icon_vertical_line.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.user.phone != current.user.phone,
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: "Teléfono",
            hintText: "",
            prefixIcon:
                IconWithVerticalLine(icon: Icons.phone_android_outlined),
          ),
          onChanged: (newValue) {
            context.read<SignUpCubit>().phoneChanged(newValue);
          },
          keyboardType: TextInputType.phone,
        );
      },
    );
  }
}
