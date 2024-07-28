import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/dependency_injection/injection_container.dart';
import 'package:tennis_court/src/core/router/router.gr.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'package:tennis_court/src/features/authentication/bloc/login_cubit/login_cubit.dart';

import '../components/login_header.dart';
import 'components/login_form.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.authenticatedStatus == AuthenticatedStatus.authenticated) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text('Sesión iniciada correctamente'),
              ),
            );
          context.router.pushAndPopUntil(
            const InitialPageRoute(),
            predicate: (_) => false,
          );
        }
      },
      child: Scaffold(
        // restorationId: "loginPage",
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LoginHeader(),
                BlocProvider(
                  create: (context) => sl<LoginCubit>(),
                  child: const LoginForm(),
                ),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          const TextSpan(text: "¿Aún no tienes cuenta? "),
                          TextSpan(
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            text: "Regístrate",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.router.push(const SignUpPageRoute());
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
