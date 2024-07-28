import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/theme/light.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:tennis_court/src/features/authentication/bloc/signup_cubit/signup_cubit.dart';
import 'package:tennis_court/src/features/authentication/presentation/signup_page/components/name_field.dart';
import 'package:tennis_court/src/features/authentication/presentation/signup_page/components/phone_field.dart';

import 'email_field.dart';
import 'password_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AutoRouter.of(context);
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Error autenticando')),
            );
        }
        if (state is SignUpSuccess) {
          print(state.user);
          context.read<AuthBloc>().add(
                AuthUserSignUp(state.user),
              );
        }
      },
      child: Padding(
        padding: kPagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registrarse',
              style: theme.textTheme.displayMedium,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 1.h,
                width: 80.w,
                color: theme.colorScheme.secondary,
              ),
            ),
            SizedBox(height: 50.h),
            const NameField(),
            SizedBox(height: 15.h),
            const EmailField(),
            SizedBox(height: 15.h),
            const PhoneField(),
            SizedBox(height: 15.h),
            const PasswordField(),
            const SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "¿Olvidaste tu contraseña?",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.secondary),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                const SignUpButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is! SignUpLoading
              ? () async {
                  await context.read<SignUpCubit>().signUpAttempt();
                }
              : null,
          child: state is! SignUpLoading
              ? const Text("Registrarse")
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
