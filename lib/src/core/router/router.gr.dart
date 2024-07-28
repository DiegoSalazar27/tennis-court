// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:tennis_court/src/core/router/authenticated_router.dart' as _i1;
import 'package:tennis_court/src/core/screens/initial_screen.dart' as _i6;
import 'package:tennis_court/src/features/authentication/presentation/login_page/login_page.dart'
    as _i7;
import 'package:tennis_court/src/features/authentication/presentation/signup_page/signup_page.dart'
    as _i8;
import 'package:tennis_court/src/features/authentication/presentation/welcome_page/welcome_page.dart'
    as _i9;
import 'package:tennis_court/src/features/booking/models/field.dart' as _i12;
import 'package:tennis_court/src/features/booking/presentation/screens/favorites_fields.dart'
    as _i2;
import 'package:tennis_court/src/features/booking/presentation/screens/field_appointments.dart'
    as _i3;
import 'package:tennis_court/src/features/booking/presentation/screens/field_booking_screen.dart'
    as _i4;
import 'package:tennis_court/src/features/booking/presentation/screens/home_page.dart'
    as _i5;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AuthenticatedPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthenticatedPage(),
      );
    },
    FavoritesFieldsPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritesFieldsPage(),
      );
    },
    FieldAppointmentsPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FieldAppointmentsPage(),
      );
    },
    FieldBookingScreenRoute.name: (routeData) {
      final args = routeData.argsAs<FieldBookingScreenRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FieldBookingScreen(
          key: args.key,
          field: args.field,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    InitialPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.InitialPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpPage(),
      );
    },
    WelcomeScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WelcomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthenticatedPage]
class AuthenticatedPageRoute extends _i10.PageRouteInfo<void> {
  const AuthenticatedPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthenticatedPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoritesFieldsPage]
class FavoritesFieldsPageRoute extends _i10.PageRouteInfo<void> {
  const FavoritesFieldsPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FavoritesFieldsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesFieldsPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FieldAppointmentsPage]
class FieldAppointmentsPageRoute extends _i10.PageRouteInfo<void> {
  const FieldAppointmentsPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          FieldAppointmentsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'FieldAppointmentsPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FieldBookingScreen]
class FieldBookingScreenRoute
    extends _i10.PageRouteInfo<FieldBookingScreenRouteArgs> {
  FieldBookingScreenRoute({
    _i11.Key? key,
    required _i12.Field field,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          FieldBookingScreenRoute.name,
          args: FieldBookingScreenRouteArgs(
            key: key,
            field: field,
          ),
          initialChildren: children,
        );

  static const String name = 'FieldBookingScreenRoute';

  static const _i10.PageInfo<FieldBookingScreenRouteArgs> page =
      _i10.PageInfo<FieldBookingScreenRouteArgs>(name);
}

class FieldBookingScreenRouteArgs {
  const FieldBookingScreenRouteArgs({
    this.key,
    required this.field,
  });

  final _i11.Key? key;

  final _i12.Field field;

  @override
  String toString() {
    return 'FieldBookingScreenRouteArgs{key: $key, field: $field}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomePageRoute extends _i10.PageRouteInfo<void> {
  const HomePageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.InitialPage]
class InitialPageRoute extends _i10.PageRouteInfo<void> {
  const InitialPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          InitialPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginPage]
class LoginPageRoute extends _i10.PageRouteInfo<void> {
  const LoginPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignUpPage]
class SignUpPageRoute extends _i10.PageRouteInfo<void> {
  const SignUpPageRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPageRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WelcomeScreen]
class WelcomeScreenRoute extends _i10.PageRouteInfo<void> {
  const WelcomeScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WelcomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
