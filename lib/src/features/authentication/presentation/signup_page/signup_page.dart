import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/router/router.gr.dart';
import 'package:tennis_court/src/features/authentication/bloc/signup_cubit/signup_cubit.dart';

import '../../../../core/dependency_injection/injection_container.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../components/login_header.dart';
import 'components/signup_form.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
          context.router.replaceAll([const InitialPageRoute()]);
        }
      },
      child: Scaffold(
        // restorationId: "SignUpPage",
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginHeader(),
                BlocProvider(
                  create: (context) => sl<SignUpCubit>(),
                  child: const SignUpForm(),
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
