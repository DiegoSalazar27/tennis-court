import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:tennis_court/src/features/authentication/bloc/login_cubit/login_cubit.dart';
import 'package:tennis_court/src/features/authentication/presentation/login_page/components/email_field.dart';

import '../../../../../core/theme/light.dart';
import 'password_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AutoRouter.of(context);
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Error autenticando')),
            );
        }
        if (state is LoginSuccess) {
          context.read<AuthBloc>().add(
                AuthUserLogin(
                  email: state.email,
                  password: state.password,
                ),
              );
        }
      },
      child: Padding(
        padding: kPagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Iniciar sesión',
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
            const EmailField(),
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
                const LoginButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state is! LoginLoading
              ? () async {
                  await context.read<LoginCubit>().loginAttempt();
                }
              : null,
          child: state is! LoginLoading
              ? const Text("Iniciar sesión")
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
