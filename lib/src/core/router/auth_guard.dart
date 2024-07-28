import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:tennis_court/src/features/authentication/bloc/auth_bloc/auth_bloc.dart';
import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._authBloc);
  final AuthBloc _authBloc;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authenticatedStatus = _authBloc.state.authenticatedStatus;
    log('authenticatedStatus: $authenticatedStatus');
    log("${_authBloc.state.currentUser}");

    if (authenticatedStatus == AuthenticatedStatus.authenticated) {
      return resolver.next(true);
    } else {
      resolver.redirect(
        const WelcomeScreenRoute(),
      );
    }
  }
}
