import 'package:auto_route/auto_route.dart';
import 'package:tennis_court/src/core/dependency_injection/injection_container.dart';
import 'package:tennis_court/src/core/router/auth_guard.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
// import '../dependency_injection/injection_container.dart';
// import 'auth_guard.dart';
import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route,Page')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: "/",
      guards: [AuthGuard(sl<AuthBloc>())],
      page: AuthenticatedPageRoute.page,
      children: [
        AutoRoute(
          path: '',
          page: InitialPageRoute.page,
          children: [
            AutoRoute(page: HomePageRoute.page),
            AutoRoute(page: FieldAppointmentsPageRoute.page),
            AutoRoute(page: FavoritesFieldsPageRoute.page),
          ],
        ),
        AutoRoute(
          path: '',
          page: FieldBookingScreenRoute.page,
        ),
      ],
    ),
    //No Auth
    AutoRoute(
      page: LoginPageRoute.page,
    ),
    AutoRoute(
      page: SignUpPageRoute.page,
    ),
    AutoRoute(
      // path: '/',
      page: WelcomeScreenRoute.page,
    ),
  ];
}
