import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthUserChanged>((event, emit) {
      emit(AuthState.authenticated(event.user, state: state));
    });

    on<AuthLogoutRequested>((event, emit) {
      emit(AuthState.unauthenticated(state: state));
    });

    on<AuthUserAddFavorites>((event, emit) {
      final newState = _addFavorite(event.fieldId);
      return emit(newState);
    });

    on<AuthUserRemoveFavorites>((event, emit) {
      final newState = _removeFavorite(event.fieldId);
      return emit(newState);
    });

    on<AuthUserSignUp>((event, emit) {
      final users = _createUser(event.user);

      return emit(AuthState.authenticated(
        users.last,
        state: state,
        users: users,
      ));
    });

    on<AuthUserLogin>((event, emit) {
      final user = _checkUser(event.email, event.password);
      if (user == User.empty) {
        return emit(AuthState.unauthenticated(state: state));
      }
      return emit(AuthState.authenticated(
        user,
        state: state,
      ));
    });
  }

  List<User> _createUser(User user) {
    if (state.users.any((element) => element.email == user.email)) {
      return state.users;
    }
    final newUsers = List<User>.from(state.users)
      ..add(
        User(
          email: user.email,
          password: user.password,
          name: user.name,
          phone: user.phone,
          id: state.users.length + 1,
        ),
      );

    return newUsers;
  }

  User _checkUser(String email, String password) {
    return state.users.firstWhere(
      (element) => element.email == email && element.password == password,
      orElse: () => User.empty,
    );
  }

  AuthState _addFavorite(int fieldId) {
    final user = state.currentUser.copyWith(
      favorites: List<int>.from(state.currentUser.favorites)..add(fieldId),
    );
    final newUsers = state.users.map((element) {
      if (element.id == user.id) {
        return user;
      }
      return element;
    }).toList();

    return AuthState.authenticated(user, state: state, users: newUsers);
  }

  AuthState _removeFavorite(int fieldId) {
    final user = state.currentUser.copyWith(
      favorites: List<int>.from(state.currentUser.favorites)..remove(fieldId),
    );
    final newUsers = state.users.map((element) {
      if (element.id == user.id) {
        return user;
      }
      return element;
    }).toList();

    return AuthState.authenticated(user, state: state, users: newUsers);
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      print(json);
      final currentUser = User.fromJson(json['currentUser']);
      final users = (json['users'] as List).map((user) {
        return User.fromJson(user);
      }).toList();
      final authenticatedStatus = AuthenticatedStatus.values.firstWhere(
        (v) => v.name == json['authenticatedStatus'],
        orElse: () => AuthenticatedStatus.unknown,
      );

      return AuthState(
        currentUser: currentUser,
        authenticatedStatus: authenticatedStatus,
        users: users,
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return {
      'currentUser': state.currentUser.toMap(),
      'authenticatedStatus': state.authenticatedStatus.name,
      'users': state.users.map((user) => user.toMap()).toList(),
    };
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}
