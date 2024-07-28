import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tennis_court/src/core/theme/light.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';

import '../../router/router.gr.dart';
import 'components/actions_list_custom_end_drawer.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final authCubit = BlocProvider.of<AuthBloc>(context);
    final focusScope = FocusScope.of(context);

    if (focusScope.hasFocus) {
      focusScope.unfocus();
    }

    Future<void> handleLogOut() async {
      authCubit.add(AuthLogoutRequested());
      context.router.pushAndPopUntil(
        const WelcomeScreenRoute(),
        predicate: (route) => route.isFirst,
      );
    }

    return Drawer(
      width: max(300, MediaQuery.of(context).size.width * 0.30),
      backgroundColor: theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(40.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  size: 33.5,
                  color: theme.primaryColor,
                ),
                color: theme.colorScheme.secondary,
                onPressed: () {
                  final focusScope = FocusScope.of(context);
                  if (focusScope.hasFocus) {
                    focusScope.unfocus();
                  }
                  Scaffold.of(context).closeEndDrawer();
                },
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ActionsListCustomEndDrawer()],
              ),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () async => await handleLogOut(),
                    child: const Text("Cerrar sesión"),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
