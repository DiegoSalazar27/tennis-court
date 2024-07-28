import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'dependency_injection/injection_container.dart';
import 'router/router.dart';
import 'theme/light.dart';

/// 375 × 812
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // minTextAdapt: true,
      child: BlocProvider(
        lazy: false,
        create: (context) => sl<AuthBloc>(),
        child: Builder(builder: (context) {
          return MaterialApp.router(
            // restorationScopeId: 'app',
            debugShowCheckedModeBanner: false,
            theme: light,
            routerConfig: appRouter.config(
              reevaluateListenable: ReevaluateListenable.stream(
                context.watch<AuthBloc>().stream,
              ),
            ),
          );
        }),
      ),
    );
  }
}
